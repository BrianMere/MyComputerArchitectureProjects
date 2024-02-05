`include "pipeline_structs_defs.svh"

module MEM_stage (
    input EXMEM_t EXMEM_prev,
    output MEMWB_t MEMWB_o,
    output logic memRDEN2,
    output logic memWE2,
    output logic[13:12] SIZE,
    output logic SIGN
);

    // Give data from this stage for the mem module...
    assign memRDEN2 = EXMEM_prev.DEEX_prev.memRead2;
    assign memWE2 = EXMEM_prev.DEEX_prev.memWrite2;
    assign SIZE = EXMEM_prev.DEEX_prev.IR[13:12];
    assign SIGN = EXMEM_prev.DEEX_prev.IR[14];

    // Pass-through data
    assign MEMWB_o.EXMEM_prev = EXMEM_prev;
    
endmodule
