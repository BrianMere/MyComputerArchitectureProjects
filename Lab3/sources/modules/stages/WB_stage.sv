`include "pipeline_structs_defs.svh"

module WB_stage (
    input MEMWB_t MEMWB_prev, // Previous Pipeline data...
    input [31:0] D2,        // Memory-read value,
    output logic [31:0] WD  // Selected write data from given conditions...
);

    always_comb begin
        
        // Mux into REG_FILE
        case (MEMWB_prev.EXMEM_prev.rf_wr_sel)
            2'b00: WD = MEMWB_prev.EXMEM_prev.DEEX_prev.PC + 4;
            2'b01: WD = 0; //used to be csr_RD
            2'b10: WD = D2;
            2'b11: WD = MEMWB_prev.EXMEM_prev.alu_res;
        endcase
    end


    
endmodule
