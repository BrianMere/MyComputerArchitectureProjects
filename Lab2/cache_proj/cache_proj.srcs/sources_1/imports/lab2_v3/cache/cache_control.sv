/* MODIFY. The cache controller. It is a state machine
that controls the behavior of the cache. */

module cache_control #(
    parameter num_ways = 2
)(
    mem_itf.device cpu_itf,
    mem_itf.controller ca_itf,
    cache_control_itf.fsm fsm
);

typedef enum { 
    STBY,   // default 'catch-all' state
    READ,   // read to cache only
    WRITE,  // write to cache only
    // TODO: //WAIT    // for synch. arrays. 
    PUSH_CA,// push data to CA
    PULL_CA // pull data from CA
} c_state;

c_state PS, NS;
// FS is a future state in case we need two states. 

logic [0:num_ways-1] hit, dirty, valid;
logic read, write, clk, rst, data_w_en, mem_resp,
mem_valid_m, push_to_mem, valid_w_en, valid_w_data,
dirty_w_en, dirty_w_data, lru_w_en, lru_w_data, lru_bit, way_sel;
logic [8*32-1:0] w_data;
logic [31:0] cpu_w_data;
// valid here is the valid bit from the cache.
// mem_valid is an output from the FSM to say when our read memory is correct. 

// interfacing...
always_comb begin
    read = cpu_itf.mem_read;
    write = cpu_itf.mem_write;
    clk = cpu_itf.clk;
    rst = cpu_itf.rst;

    // inputs 
    valid = fsm.valid;
    dirty = fsm.dirty;
    hit = fsm.hit;
    mem_valid_m = fsm.mem_valid_m;
    lru_bit = fsm.lru_bit;

    // outputs 
    data_w_en = fsm.data_w_enable;
    mem_resp = fsm.mem_resp;
    push_to_mem = fsm.push_to_mem;
    valid_w_en = fsm.valid_w_en;
    dirty_w_en = fsm.dirty_w_toggle;
    lru_w_en = fsm.lru_toggle;

    valid_w_data = fsm.valid_w_data;
    dirty_w_data = fsm.dirty_w_data;
    lru_w_data = fsm.lru_w_data;
    way_sel = fsm.way_sel;

    w_data = fsm.w_data;
    cpu_w_data = cpu_itf.mem_wdata;
end

// tasks for readability

task getLRUData(output data);
    if(hit[0]) begin
        data = 0;
    end
    else if(hit[1]) begin
        data = 1;
    end
    else begin
        data = lru_bit;
    end
endtask 

task push_to_CA();
    data_w_en = 0;
    mem_resp = 0;
    push_to_mem = 1;
    valid_w_en = 0;
    dirty_w_en = 1;
    lru_w_en = 0;

    valid_w_data = 0; // don't care but just in case.
    dirty_w_data = 0; // always write D <= 0
    getLRUData(lru_w_data);
endtask 

task pull_from_CA();
    data_w_en = 1;
    mem_resp = 0;
    push_to_mem = 0;
    valid_w_en = 1;
    dirty_w_en = 1;
    lru_w_en = 0;

    valid_w_data = 1;
    dirty_w_data = 0;
    getLRUData(lru_w_data);
endtask 

task write_to_cache(input mem_r);
    data_w_en = 1;
    mem_resp = mem_r;
    push_to_mem = 0;
    valid_w_en = 1;
    dirty_w_en = 1;
    lru_w_en = 1;

    valid_w_data = 1;
    dirty_w_data = 1;
    getLRUData(lru_w_data);
endtask

task read_from_cache();
    data_w_en = 0;
    mem_resp = 1;
    push_to_mem = 0;
    valid_w_en = 0;
    dirty_w_en = 0;
    lru_w_en = 0;

    valid_w_data = 1;
    dirty_w_data = 0;
    getLRUData(lru_w_data);
endtask 

task default_output();
    data_w_en = 0;
    mem_resp = 0;
    push_to_mem = 0;
    valid_w_en = 0;
    dirty_w_en = 0;
    lru_w_en = 0;

    valid_w_data = 0; // don't care but just in case.
    dirty_w_data = 0; // always write D <= 0
    lru_w_data = 0;
endtask

initial begin
    PS = STBY;
    NS = STBY;
end

// state register. 
always_ff @(posedge clk) begin
    PS <= NS;
    // update w_data based on state:  		
    assign mem_rdata = mem_rdata256[(32*address[4:2]) +: 32];		//CPU rdata <-  from cache line read (rdata256)
    assign mem_byte_enable256 = {28'h0, mem_byte_enable} << (address[4:2]*4);	//byte enable mask to data_arary in cache  //32bit Cache write enable <- 4-bit CPU strobe (byte enable) 

    case(NS)
        PULL_CA: w_data <= {8{cpu_w_data}} //Cache write data <-  from CPU wdata
        default: w_data <= 
    endcase
end

// next state logic
always_comb begin
    case (PS)
        STBY: begin
            if((!read && !write) || (read && write)) begin
                NS = STBY;
            end
            else if(!valid) begin
                if(read && !write) begin // read
                    NS = PULL_CA;
                end
                else begin // write
                    NS = PUSH_CA;
                end
            end
            else if(!hit || dirty) begin // need to pull from CA anyways
                if(read && !write) begin
                    NS = PULL_CA;
                end
                else begin
                    NS = PUSH_CA;
                end
            end
            else begin // we have a valid hit that's not dirty. Just R/W
                if(read && !write) begin
                    NS = READ;
                end
                else begin
                    NS = WRITE;
                end
            end
        end
        READ: begin
            NS = STBY;
        end
        WRITE: begin
            if(read && !write) begin
                NS = READ; // its possible we were writing to cache to read. 
            end
            else begin // we were actually writing. No confirm is needed. 
                NS = STBY;
            end
        end
        PUSH_CA: begin // on push want to see what was our other operation. 
            if(read && !write) begin
                NS = READ;
            end
            else begin
                NS = WRITE;
            end
        end
        PULL_CA: begin
            if(read && !write) begin
                NS = READ;
            end
            else begin
                NS = WRITE;
            end
        end
        default: NS = STBY;
    endcase
end

// state outputs
always_comb begin
    case (PS)
        STBY: begin
            default_output();
        end
        READ: begin
            read_from_cache(); // reads always are mem_resp
        end
        WRITE: begin
            if(NS == STBY) begin
                write_to_cache(1);
            end
            else begin
                write_to_cache(0);
            end
        end
        PUSH_CA: begin
            push_to_CA();
        end
        PULL_CA: begin
            pull_from_CA();
        end
        default: begin
            default_output();
        end
    endcase
end

endmodule : cache_control
