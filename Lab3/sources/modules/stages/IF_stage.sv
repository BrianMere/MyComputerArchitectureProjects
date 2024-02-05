`include "pipeline_structs_defs.svh"

module IF_stage(
    input pc_reset, // flag to reset PC to 0's
    input [31:0] IR,
    input pc_write, // flag to allow writes to PC. Usually 1.
    input BRANCH_WIRES_t br_wires,
    input [2:0] pc_selector, // selector for which new PC val to use.
    input CLK,
    output IFDE_t IFDE_o // Pipeline struct to DE stage
);

    logic [31:0] pc_p4; // plus 4 current PC count
    logic [31:0] pc_selection; // selection output from our PCMUX


    program_counter PROG_COUNT(
        .PC_WRITE(pc_write),
        .PC_RST(pc_reset),
        .PC_DIN(pc_selection),
        .CLK(CLK),
        .PC_COUNT(IFDE_o.PC)
    );

    add4adder PLUS4(
        .operand(IFDE_o.PC),
        .added_out(pc_p4)
    );

    mux6sel PCMUX(
        .PC_P4(pc_p4),
        .JALR(br_wires.jalr),
        .BRANCH(br_wires.branch),
        .JAL(br_wires.jal),
        .MTVEC(0), //NOT USED!!!
        .MEPC(0), // NOT USED!!!
        .PC_SOURCE(pc_selector),
        .PC_DOUT(pc_selection)
    );
    
    always_comb begin 
        IFDE_o.IR = IR;
    end 
    
endmodule
