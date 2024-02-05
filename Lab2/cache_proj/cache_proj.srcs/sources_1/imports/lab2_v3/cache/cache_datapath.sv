/* MODIFY. The cache datapath. It contains the data,
valid, dirty, tag, and LRU arrays, comparators, muxes,
logic gates and other supporting logic. */

module cache_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index,
    parameter num_ways = 2
)
(
    mem_itf.device cpu_itf,
    mem_itf.controller ca_itf,
    cache_control_itf.fsm fsm
);

// CPU i/o MACROS
localparam NUM_BITS = s_tag + s_offset + s_index;

logic c_clk, c_rst;
logic [NUM_BITS - s_tag - 1:s_offset-1] index_val;
logic [s_offset-1:0] offset_val;
logic [NUM_BITS-1: NUM_BITS-s_tag] tag_val;
logic read_en;
logic write_en;
logic [NUM_BITS-1:0] w_data;
logic [3:0] byte_en;
logic [NUM_BITS-1:0] data_out;
logic d_resp;
logic internal_hits[0:num_ways-1];

always_comb begin

    // CPU outputs
    c_clk = cpu_itf.clk;
    c_rst = cpu_itf.rst;
    index_val = cpu_itf.mem_address[NUM_BITS-s_tag - 1 +: s_index];
    offset_val = cpu_itf.mem_address[s_offset-1 +: s_offset];
    tag_val = cpu_itf.mem_address[NUM_BITS +: s_tag];
    read_en = cpu_itf.mem_read;
    w_data = fsm.w_data; // figure out in the fsm. 
    byte_en = cpu_itf.byte_enable;

    // FSM signals (others are defined more sophisticatedly)
    d_resp = fsm.mem_resp; // we'' use the FSM to dictate when we are gucci. 
    fsm.mem_data = ca_itf.mem_rdata;
    fsm.mem_valid_m = ca_itf.mem_resp;
end

// my logic
logic [s_tag:0] tag_out [0:num_ways];
logic [s_tag + s_offset + s_index:0] data_out_per [0:num_ways];
logic valid_out_per [0:num_ways];
logic dirty_out_per [0:num_ways];
logic lru_bits;

// declare our arrays of data
genvar i;
generate
    for(i = 0; i < num_ways; i++) begin
        // tag array (needs to manually be generated with each tag_out[i] signal)
        array #(.s_index(s_index), .width(s_tag)) tag_array[i] (
            .clk(c_clk),
            .rst(c_rst),
            .rindex(index_val), // read from this value of index
            .read(read_en), // read enable
            .load(write_en),
            .rindex(index_val),
            .windex(index_val),
            .datain(w_data),
            .dataout(tag_out[i])
        );

        // data
        data_array #(.s_offset(s_offset), .s_index(s_index)) data[i] (
            .clk(c_clk),
            .rst(c_rst),
            .read(read_en),
            .write_en(write_en),
            .rindex(index_val),
            .windex(index_val),
            .datain(w_data), //2^8 bits or  
            .dataout(data_out_per[i])
        );

        // our valid bit indicates when we've written at all to a certain location. Always starts at 0, and becomes 1 when written to. 
        array #(.s_index(s_index), .width(1)) valid_arr[i] (
            .clk(c_clk),
            .rst(c_rst),
            .rindex(index_val), // read from this value of index
            .read(read_en), // read enable
            .load(write_en),
            .rindex(index_val),
            .windex(index_val),
            .datain(1),
            .dataout(valid_out_per[i])
        );

        // our dirty bit indicates information for the write-back policy. Says whether it newer than memory. If not we don't need to write.
        array #(.s_index(s_index), .width(1)) dirty_arr[i] (
            .clk(c_clk),
            .rst(c_rst),
            .rindex(index_val), // read from this value of index
            .read(read_en), // read enable
            .load(write_en),
            .rindex(index_val),
            .windex(index_val),
            .datain(w_data),
            .dataout(dirty_out_per[i])
        );
    end
endgenerate

// LRU array: is a bit to indicate whether to replace the left/right way. 1 says to use 
// NOTE: future TODO this isn't dynamic yet with num_ways at the moment
array #(.s_index(s_index), .width(1)) lru_arr (
    .clk(c_clk),
    .rst(c_rst),
    .rindex(index_val), // read from this value of index
    .read(read_en), // read enable
    .load(write_en),
    .rindex(index_val),
    .windex(index_val),
    .datain(w_data),
    .dataout(lru_bits)
);

// Make a 2-way, write-back/allocate, set associative cache datapath. 
always_comb begin
    ca_itf.clk = cpu_itf.clk; // synch the clocks
    ca_itf.rst = cpu_itf.rst; // synch the resets
    valid_arr.rst = cpu_itf.rst; // synch resets. 
end

// hit detector (comparator)
initial begin
    fsm.hit = '0;
end

generate
    logic way_num; // give the way number where a hit was detected. 
    for(i = 0; i < num_ways; i++) begin
        always_comb begin
            if(tag_out[i] == tag_val && valid_out_per[i]) begin
                internal_hits[i] = 1;
            end
            else begin
                internal_hits[i] = 0;
            end
        end
    end
endgenerate

// valid/dirty bit to FSM
always_comb begin
    fsm.dirty = dirty_out_per[way_num];
    fsm.valid = valid_out_per[way_num];

    // data out control
    data_out = data_out_per[way_num];
end

generate
    initial begin
        fsm.hit = 0;
        fsm.lru_bit = lru_bits;
    end
    for(i = 0; i < num_ways; i++) begin
        always_comb begin
            // FSM Stuffs
            if(internal_hits[i] == lru_bits) begin
                fsm.hit = 1;
                fsm.lru_bit = i;
            end
        end
    end
endgenerate

endmodule : cache_datapath
