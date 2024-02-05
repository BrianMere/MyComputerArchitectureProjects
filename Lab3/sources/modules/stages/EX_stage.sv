`timescale 1ns / 1ps

`include "pipeline_structs_defs.svh"

module EX_stage(
        input DEEX_t DEEX_prev,           // input from pipeline
        input [31:0] RS1,       // RS1 from RegFile
        input [31:0] RS2,       // RS2 from RegFile
        output BRANCH_WIRES_t br_wires,     // branch addresses from branch calcs in EX...
        output BRANCH_STATUS_t br_status,   // branch status calcs from EX...
        output EXMEM_t EXMEM_o              // pipeline connector...
    );

    BRANCH_COND_GEN br_cond_gen(
        .RS1(RS1),
        .RS2(RS2),
        .BR_EQ(br_status.br_eq),
        .BR_LT(br_status.br_lt),
        .BR_LTU(br_status.br_ltu)
    );

    BRANCH_ADDR_GEN br_addr_gen(
        .PC(DEEX_prev.PC),
        .J_TYPE(DEEX_o.imms.J_TYPE),
        .B_TYPE(DEEX_o.imms.B_TYPE),
        .I_TYPE(DEEX_o.imms.I_TYPE),
        .RS1(RS1),
        .JALR(br_wires.jalr),
        .BRANCH(br_wires.branch),
        .JAL(br_wires.jal)
    );

    CU_DCDR CU_Decoder(
        .OPCODE(DEEX_prev.IR[6:0]),
        .SIZE_SIGN(DEEX_prev.IR[14:12]),
        .IR(DEEX_prev.IR[30]),
        .int_taken(0), // NOT USED!!! If interrupts added we use this...
        .br_eq(br_status.br_eq),
        .br_lt(br_status.br_lt),
        .br_ltu(br_status.br_ltu),
        .alu_fun(EXMEM_o.alu_fun),
        .alu_srcA(EXMEM_o.alu_srcA),
        .alu_srcB(EXMEM_o.alu_srcB),
        .pcSource(EXMEM_o.pcSource),
        .rf_wr_sel(EXMEM_o.rf_wr_sel)
    );

    logic [31:0] ex_srcA, ex_srcB; // local logic for passing src data to ALU

    always_comb begin

        // Mux ALU A
        case (EXMEM_o.alu_srcA)
            2'b00: ex_srcA = RS1;
            2'b01: ex_srcA = DEEX_prev.imms.U_TYPE;
            2'b10: ex_srcA = ~(RS1);
            default: ex_srcA = 0;
        endcase

        // Mux ALU B
        case (EXMEM_o.alu_srcB)
            3'b000: ex_srcB = RS2;
            3'b001: ex_srcB = DEEX_prev.imms.I_TYPE;
            3'b010: ex_srcB = DEEX_prev.imms.S_TYPE;
            3'b011: ex_srcB = DEEX_prev.PC;
            3'b100: ex_srcB = 0; // used to be csr_RD
            default: ex_srcB = 0;
        endcase
    end

    ALU alu(
        .srcA(ex_srcA),
        .srcB(ex_srcB),
        .alu_fun(EXMEM_o.alu_fun),
        .result(EXMEM_o.alu_res)
    );

    always_comb begin
        EXMEM_o.RS1_val = ex_srcA;
        EXMEM_o.RS2_val = ex_srcB;
        EXMEM_o.DEEX_prev = DEEX_prev;
    end
    

endmodule
