`ifndef CACHE_CONTROL_ITF
`define CACHE_CONTROL_ITF

interface cache_control_itf #(
    parameter num_ways = 2
)(
    );

    logic data_w_enable; // indicates that we want to write TO DATAPATH! Doesn't say if we want to write as an operation. Reads will write to cache. 
    logic hit[0:num_ways-1];      // indicates currently if we have a hit. 
    logic dirty[0:num_ways-1];    // indicates that the currently selected way is dirty
    logic valid[0:num_ways-1];    // indicates that the currently selected way is valid
    logic mem_resp; // indicates that the memory we have OUTPUT is currently good. 
    logic mem_valid_m; // indicates that the memory we have pulled from ext. mem is good (for either write/read)
    logic push_to_mem; // incdicates the cache wants to push memory to the ca. 
    logic valid_w_en; // sets the valid bit to high of current way. 
    logic valid_w_data;   // set data in valid. Only when enable is high.
    logic dirty_w_en;     // we want to write to our dirty bit
    logic dirty_w_data;   // write this data to dirty bit. Only when enable is high.
    logic lru_w_en;
    logic lru_w_data; 
    logic way_sel;        // selected way to operate on. Is the way that's LRU, so is the one we write to. 
    logic lru_bit;
    logic w_data;         // data to write in WRITE state. May change if writing mem data or not. 
    logic mem_data;       // data received from memory, assuming push/pull from CA

    modport fsm( 
        input hit, dirty, valid, mem_valid_m, lru_bit, mem_data,
        output data_w_enable, mem_resp, push_to_mem, 
        valid_w_en, dirty_w_en, lru_w_en,
        valid_w_data, dirty_w_data, lru_w_data, way_sel, w_data
    );

endinterface

module d_c_c_itf();
endmodule

`endif
