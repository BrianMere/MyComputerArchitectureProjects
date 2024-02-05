`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic State University, San Luis Obispo
// Engineer: Brian Mere
// 
// Create Date: 05/24/2023 11:27:10 PM
// Design Name: OTTER_MCU
// Module Name: OTTER_MCU
// Project Name: Lab3 Pipeline
// Target Devices: Basys3 Boards
// Description: Collective MCU TOP Module! With 5 stage pipeline. 
// 
// Dependencies: None
//////////////////////////////////////////////////////////////////////////////////
`include "pipeline_structs_defs.svh"

import HU::*;
import stages::*;

module Otter_MCU
#(parameter WIDTH = 32)
(
    input [31:0] IOBUS_IN,
    input RST,
    input INTR, //NOT USED CURRENTLY
    input CLK,
    output logic [31:0] IOBUS_OUT,
    output logic [31:0] IOBUS_ADDR,
    output logic IOBUS_WR
    );

    // Hazard Unit Connections

    HU_i HU_in;
    HU_o HU_out;

    assign HU_in.memValid1 = 1; // TODO: change for forwarding... 

    HazardUnit HU(
        .m_i(HU_in),
        .m_o(HU_out)
    );

    // Note: we've named DOUT1 = IR for convienience.
    // commence the connecting ...
    // We're doing a pipeline. COMMENCE THE PIPELINE!!!

    // Inter-stage logics

    IFDE IFDE_i, IFDE_o;
    DEEX DEEX_i, DEEX_o;
    EXMEM EXMEM_i, EXMEM_o;
    MEMWB MEMWB_i, MEMWB_o;

    assign reset = RST;

    BRANCH_WIRES br_wires;

    logic br_res_ex;
    logic [WIDTH-1:0] br_target_ex;
    logic [2:0] if_pcsel;

    // IF: Fetch --------------------------------------

    logic [WIDTH-1:0] if_PC, if_PCP4;
    logic if_PCWrite, if_memRead1;
    logic [WIDTH-1:0] if_pcdin;

    assign if_PCWrite = 1; // TODO: change for forwarding... 
    assign if_memRead1 = 1;
    assign IFDE_i.flush_if_r = 0;

    IFDE_strct IFDE_module(
        .clk(CLK),
        .rst(HU_out.IFDE_flsh),
        .enable(HU_out.IFDE_en),
        .IFDE_i(IFDE_i),
        .IFDE_o(IFDE_o)
    );

    add4adder PLUS4(
        .operand(if_PC),
        .added_out(if_PCP4)
    );

    program_counter PROG_COUNT(
        .PC_WRITE(if_PCWrite),
        .PC_RST(reset),
        .PC_DIN(if_pcdin),
        .CLK(CLK),
        .PC_COUNT(if_PC)
    );

    branch_prediction BRCH_P(
        .br_res_ex(br_res_ex),
        .br_target_ex(br_target_ex),
        .pc_sel(if_pcsel),
        .jalr(br_wires.jalr),
        .branch(br_wires.branch),
        .jal(br_wires.jal)
    );

    mux6sel PCMUX(
        .PC_P4(if_PCP4),
        .JALR(br_wires.jalr),
        .BRANCH(br_wires.branch),
        .JAL(br_wires.jal),
        .MTVEC(de_mtvec),
        .MEPC(de_mepc),
        .PC_SOURCE(if_pcsel),
        .PC_DOUT(if_pcdin)
    );

    assign IFDE_i.PC = if_PC;

    // DE: Decode -------------------------------

    // Logics

    logic [WIDTH-1:0] de_ir;
    logic de_int_taken;

    logic [WIDTH-1:0] de_RS1;
    logic [WIDTH-1:0] de_RS2;

    assign de_int_taken = 0; // NO CSR!!!

    DEEX_strct DEEX_module(
        .clk(CLK),
        .rst(HU_out.DEEX_flsh),
        .enable(HU_out.DEEX_en),
        .DEEX_i(DEEX_i),
        .DEEX_o(DEEX_o)
    );

    CU_DCDR CU_Decoder(
        .OPCODE(de_ir[6:0]),
        .SIZE_SIGN(de_ir[14:12]),
        .IR(de_ir[30]),
        .int_taken(de_int_taken),
        // .br_eq(br_eq),
        // .br_lt(br_lt),
        // .br_ltu(br_ltu),
        .alu_fun(DEEX_i.alu_fun),
        .alu_srcA(DEEX_i.alu_srcA),
        .alu_srcB(DEEX_i.alu_srcB),
        //.pcSource(if_pcsel),
        .rf_wr_sel(DEEX_i.rf_wr_sel),
        .regWRITE(DEEX_i.regWrite),
        .memWE2(DEEX_i.memWrite2),
        .memRDEN2(DEEX_i.memRead2),
        .opcode(DEEX_i.opcode)
    );

    IMMEDS de_imms;

    IMMED_GEN imm_generator(
        .INSTRUCT(de_ir[31:7]),
        .U_TYPE(de_imms.U_TYPE),
        .I_TYPE(de_imms.I_TYPE),
        .S_TYPE(de_imms.S_TYPE),
        .J_TYPE(de_imms.J_TYPE),
        .B_TYPE(de_imms.B_TYPE)
    );

    // CSR CSR(
    //     .CSR_RST(reset),
    //     .CSR_mret_exec(mret_exec),
    //     .CSR_INT_TAKEN(int_taken),
    //     .CSR_ADDR(de_ir[31:20]),
    //     .CSR_WR_EN(csr_WE),
    //     .CSR_PC(PC),
    //     .CSR_WD(result),
    //     .CSR_CLK(CLK),
    //     .CSR_MSTATUS_B3(mstatus_b3),
    //     .CSR_MEPC(mepc),
    //     .CSR_MTVEC(mtvec),
    //     .CSR_RD(csr_RD)
    // );

    // Connect PR's (misc.)
    assign DEEX_i.PC = IFDE_o.PC;
    assign DEEX_i.imms = de_imms;
    assign DEEX_i.RS1 = de_RS1;
    assign DEEX_i.RS2 = de_RS2;
    assign DEEX_i.IR = de_ir;

    // EX: Execute ----------------------------

    logic ex_br_eq, ex_br_lt, ex_br_ltu;
    logic [WIDTH-1:0] ex_srcA, ex_srcB;

    EXMEM_strct EXMEM_module(
        .clk(CLK),
        .rst(HU_out.EXMEM_flsh),
        .enable(HU_out.EXMEM_en),
        .EXMEM_i(EXMEM_i),
        .EXMEM_o(EXMEM_o)
    );

    BRANCH_ADDR_GEN br_addr_gen(
        .PC(DEEX_o.PC),
        .J_TYPE(DEEX_o.imms.J_TYPE),
        .B_TYPE(DEEX_o.imms.B_TYPE),
        .I_TYPE(DEEX_o.imms.I_TYPE),
        .RS1(DEEX_o.RS1),
        .JALR(br_wires.jalr),
        .BRANCH(br_wires.branch),
        .JAL(br_wires.jal)
    );

    BRANCH_COND_GEN br_cond_gen(
        .RS1(DEEX_o.RS1),
        .RS2(DEEX_o.RS2),
        .BR_EQ(ex_br_eq),
        .BR_LT(ex_br_lt),
        .BR_LTU(ex_br_ltu)
    );

    ALU alu(
        .srcA(ex_srcA),
        .srcB(ex_srcB),
        .alu_fun(DEEX_o.alu_fun),
        .result(EXMEM_i.alu_res)
    );

    always_comb begin

        // Mux ALU A
        case (DEEX_o.alu_srcA)
            2'b00: ex_srcA = DEEX_o.RS1;
            2'b01: ex_srcA = DEEX_o.imms.U_TYPE;
            2'b10: ex_srcA = ~(DEEX_o.RS1);
            default: ex_srcA = 0;
        endcase

        // Mux ALU B
        case (DEEX_o.alu_srcA)
            3'b000: ex_srcB = DEEX_o.RS2;
            3'b001: ex_srcB = DEEX_o.imms.I_TYPE;
            3'b010: ex_srcB = DEEX_o.imms.S_TYPE;
            3'b011: ex_srcB = DEEX_o.PC;
            3'b100: ex_srcB = 0; // used to be csr_RD
            default: ex_srcB = 0;
        endcase

        IOBUS_ADDR = EXMEM_i.alu_res;
        IOBUS_OUT = DEEX_o.RS2;
    end

    assign EXMEM_i.PC = DEEX_o.PC;
    assign EXMEM_i.frs2_ex = DEEX_o.RS2;
    assign EXMEM_i.IR = DEEX_o.IR;
    assign EXMEM_i.regWrite = DEEX_o.regWrite;
    assign EXMEM_i.memWrite2 = DEEX_o.memWrite2;
    assign EXMEM_i.memRead2 = DEEX_o.memRead2;
    assign EXMEM_i.rf_wr_sel = DEEX_o.rf_wr_sel;

    // MEM: Memory -------------------------------

    logic [1:0] strobe;
    logic sign;

    MEMWB_strct MEMWB_module(
        .clk(CLK),
        .rst(HU_out.MEMWB_flsh),
        .enable(HU_out.MEMWB_en),
        .MEMWB_i(MEMWB_i),
        .MEMWB_o(MEMWB_o)
    );

    // Strobe gen
    assign strobe = EXMEM_o.IR[13:12];
    assign sign = EXMEM_o.IR[14];


    assign MEMWB_i.PC = EXMEM_o.PC;
    assign MEMWB_i.alu_res = EXMEM_o.alu_res;
    assign MEMWB_i.rf_wr_sel = EXMEM_o.rf_wr_sel;

    // WB: Writeback -----------------------------

    logic [WIDTH-1:0] wb_wd;
    logic [WIDTH-1:0] DOUT2;

    always_comb begin
        
        // Mux into REG_FILE
        case (MEMWB_o.rf_wr_sel)
            2'b00: wb_wd = MEMWB_o.PC + 4;
            2'b01: wb_wd = 0; //used to be csr_RD
            2'b10: wb_wd = DOUT2;
            2'b11: wb_wd = MEMWB_o.alu_res;
        endcase
    end

    // MISC (part of many parts of the pipeline with different inputs/outputs)
    logic misc_err;
    OTTER_mem_byte otter_memory(
        .MEM_CLK(CLK),
        .MEM_READ1(if_memRead1),
        .MEM_READ2(EXMEM_o.memRead2),
        .MEM_WRITE2(EXMEM_o.memWrite2),
        .MEM_ADDR1(if_PC),
        .MEM_ADDR2(EXMEM_o.alu_res),
        .MEM_DIN2(EXMEM_o.frs2_ex),
        .MEM_SIZE(strobe),
        .MEM_SIGN(sign),
        .IO_IN(IOBUS_IN),
        .IO_WR(IOBUS_WR),
        .MEM_DOUT1(de_ir),
        .MEM_DOUT2(DOUT2),
        .ERR(misc_err)
    );

    // TODO: where is the mem_resp for WB? Answer: add with cache when that's done. 

    REG_FILE registers(
        .RF_ADR1(de_ir[19:15]),
        .RF_ADR2(de_ir[24:20]),
        .RF_WA(de_ir[11:7]),
        .RF_WD(wb_wd),
        .RF_EN(EXMEM_o.regWrite),
        .CLK(CLK),
        .RF_RS1(de_RS1),
        .RF_RS2(de_RS2)
    );

    // Unused old code: 

    // CU_FSM State_Machine(
    //     .RST(RST),
    //     .CS_INTR(INTR & mstatus_b3),
    //     .OPCODE(IR[6:0]),
    //     .SIZE_SIGN(IR[14:12]),
    //     .CLK(CLK),
    //     .PCWRITE(PCWrite),
    //     .regWRITE(regWrite),
    //     .memWE2(memWE2),
    //     .memRDEN1(memRDEN1),
    //     .memRDEN2(memRDEN2),
    //     .reset(reset),
    //     .csr_WE(csr_WE),
    //     .int_taken(int_taken),
    //     .mret_exec(mret_exec)
    // );

endmodule
