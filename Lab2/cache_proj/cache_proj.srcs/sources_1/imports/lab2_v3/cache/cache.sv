/* MODIFY. Your cache design. It contains the cache
controller, cache datapath, and bus adapter. */
/* 
    Top module of cache, as seen from the MCU. 
*/
module cache #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
    mem_itf.device cpu_itf,
    mem_itf.controller ca_itf
);

localparam NUM_BITS = s_tag + s_offset + s_index;

logic [8*(NUM_BITS-1):0] mem_wdata256;
logic [NUM_BITS-1:0] mem_rdata;
logic [8*(NUM_BITS-1):0] mem_byte_enable256;

always_comb begin
    cpu_itf.clk = ca_itf.clk; // synch the clocks
    cpu_itf.rst = ca_itf.rst; // synch the resets
    cpu_itf.mem_read = ca_itf.mem_read;
    cpu_itf.mem_write = ca_itf.mem_write;
    cpu_itf.mem_address = ca_itf.mem_address;
end

cache_control_itf.fsm cache_control_data; // gives the itf for cache data, whatever we define it as. 

// the control is the 'FSM' of all of this. 
cache_control control(
    .cpu_itf(cpu_itf), 
    .ca_itf(ca_itf),
    .fsm(cache_control_data)
    );

// contains all the related data (tag and data tables)
// the inputs/outputs here may be arbitrary and thus won't use the itf. 
cache_datapath datapath(
    .cpu_itf(cpu_itf),
    .ca_itf(ca_itf),
    .fsm(cache_control_data)
);

//Sample code to convert CPU bus requests (32-bit data) to cache signals (mostly 256-bit data)

// assign mem_wdata256 = {8{mem_wdata}};   	//Cache write data <-  from CPU wdata	
// assign mem_rdata = mem_rdata256[(32*address[4:2]) +: 32];		//CPU rdata <-  from cache line read (rdata256)
// assign mem_byte_enable256 = {28'h0, mem_byte_enable} << (address[4:2]*4);	//byte enable mask to data_arary in cache  //32bit Cache write enable <- 4-bit CPU strobe (byte enable) 

endmodule : cache
