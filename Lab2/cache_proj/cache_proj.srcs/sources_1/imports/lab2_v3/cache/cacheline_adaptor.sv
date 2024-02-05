/*
    Adaptor connects the cache output to read/write to/from memory. 
*/
module cacheline_adaptor
#(
    parameter int NUM_BYTES = 8        // Integer of number bytes to burst at a time (both directions) 
)
(
    mem_itf.device ca_itf,             // controller: from the cache
    mem_itf.controller pmem_itf       // device: between ca and actual memory. Already is 256 bits wide. 
);

typedef enum {  
    STBY, // wait for instruction. Don't do anything.
    LOAD, // load a word from memory into buffer one word at a time, and send all at once.
    STORE // store 256 bits into memory at increments of 32 bits from buffer 
} adaptor_state;

logic PS, NS;
logic i;
logic [32*NUM_BYTES - 1:0] buffer;

initial begin
    PS = STBY;
    NS = STBY;
    i = 0;
end

always_ff @(posedge pmem.clk) begin
    PS <= NS;
    case (PS)
        STBY: begin
            i <= 0;
        end
        LOAD: begin 
            i++;
            buffer[32*i +: 32] <= pmem_itf.mem_rdata;
            if(i == NUM_BYTES) begin
                i <= '0;
                ca_itf.mem_resp <= '1;
            end
            else begin
                ca_itf.mem_resp <= '0;
            end
        end
        STORE: begin
            i++;
            pmem_itf.mem_wdata <= buffer[32*i +: 32];
            pmem_itf.mem_byte_enable <= '1 << i; // get the byte needed. 
            if(i == NUM_BYTES) begin
                i <= '0;
                ca_itf.mem_resp <= '1;
            end
            else begin
                ca_itf.mem_resp <= '0;
            end
        end
        default: ; 
    endcase
end

always_comb begin

    pmem_itf.clk = ca_itf.clk; // Synch the clks. 
    pmem_itf.rst = ca_itf.rst; // Synch resets
    pmem_itf.mem_read = ca_itf.mem_read; // ...
    pmem_itf.mem_write = ca_itf.mem_write;
    pmem_itf.mem_address = ca_itf.mem_address & 32'hFFFFFFE0; // addresses are the same (ie: no virtual memory)
    // mask the bottom bits as we are word-addressable. 

    // mem_wdata and mem_byte_enable handled by STORE below. 

    case (PS)
        STBY: begin
            if((ca_itf.mem_read && ca_itf.mem_write) || (!ca_itf.mem_read && !ca_itf.mem_write)) begin
                NS = STBY;
            end
            else if(ca_itf.mem_read && pmem_itf.mem_resp) begin // don't move to start loading until memory is ready.
                NS = LOAD;
            end
            else if(ca_itf.mem_write && pmem_itf.mem_resp) begin // same with storing data. 
                NS = STORE;
            end
            else begin
                NS = STBY;
            end
        end 
        LOAD: begin
            if(i == NUM_BYTES) begin
                NS = STBY;
            end
        end
        STORE: begin
            if(i == NUM_BYTES) begin
                NS = STBY;
            end
        end
        default: begin
            NS = STBY;
        end
    endcase
end

 

endmodule : cacheline_adaptor