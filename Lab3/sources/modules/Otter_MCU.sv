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

    // Pipeline stage data
    IFDE_t IFDE_i, IFDE_o;
    DEEX_t DEEX_i, DEEX_o;
    EXMEM_t EXMEM_i, EXMEM_o;
    MEMWB_t MEMWB_i, MEMWB_o;

    initial begin // default values... these are fine
        IFDE_i = N_IFDE; 
        DEEX_i = N_DEEX;
        EXMEM_i = N_EXMEM;
        MEMWB_i = N_MEMWB;
    end
    
    BRANCH_WIRES_t br_wires;
    BRANCH_STATUS_t br_status;

    HU_i_t HU_in;
    HU_o_t HU_out;

    // the inputs of the HU are always just the pipeline regs...
    always_comb begin : ConnectPipelineRegsToHU
        HU_in.IFDE_data = IFDE_o;
        HU_in.DEEX_data = DEEX_o;
        HU_in.EXMEM_data = EXMEM_o;
        HU_in.MEMWB_data = MEMWB_o;
    end
    

    // Hazard Unit (HU)
    HazardUnit HU
    (
        .CLK(CLK),
        .RST(RST),
        .m_i(HU_in),
        .m_o(HU_out)
    );

    // IF to DE ... 

    branch_prediction bp(
        .pcSource(EXMEM_i.pcSource),
        .pred_info(HU_in.pred_status)
    );

    IF_stage IFDE_stg(
        .pc_reset(RST),
        .IR(IR),
        .pc_write(HU_out.pc_enable),
        .br_wires(br_wires),
        .pc_selector(HU_out.if_pc_selection),
        .CLK(CLK),
        .IFDE_o(IFDE_i)
    );

    IFDE_strct IFDE_module(
        .clk(CLK),
        .flush(HU_out.IFDE_fl),
        .enable(HU_out.IFDE_en),
        .IFDE_i(IFDE_i),
        .IFDE_o(IFDE_o)
    );

    // ALL THIS GOES TO MEM DOWN BELOW...

    logic [31:0] IR;
    OTTER_mem_byte otter_memory(
        .MEM_CLK(CLK),
        .MEM_READ1(HU_out.memRDEN1),
        .MEM_READ2(HU_out.memRDEN2),
        .MEM_WRITE2(HU_out.memWE2),
        .MEM_ADDR1(IFDE_i.PC),
        .MEM_ADDR2(EXMEM_o.alu_res),
        .MEM_DIN2(EXMEM_o.RS2_val),
        .MEM_SIZE(HU_in.MEM_SIZE),
        .MEM_SIGN(HU_in.MEM_SIGN),
        .IO_IN(IOBUS_IN),
        .IO_WR(IOBUS_WR),
        .MEM_DOUT1(IR),
        .MEM_DOUT2(HU_in.WB_DOUT2),
        .ERR(HU_in.mem_err)
    );

    /////////////////

    // DE stage ...

    REG_FILE registers(
        .RF_ADR1(IFDE_i.IR[19:15]), 
        .RF_ADR2(IFDE_i.IR[24:20]),
        .RF_WA(MEMWB_o.EXMEM_prev.DEEX_prev.IR[11:7]), // from WB
        .RF_WD(HU_in.WB_WD),  // from WB
        .RF_EN(MEMWB_o.EXMEM_prev.DEEX_prev.regWrite),
        .CLK(CLK),
        .RF_RS1(HU_in.EX_RS1),
        .RF_RS2(HU_in.EX_RS2)
    );

    DE_stage DEEX_stg(
        .IFDE_prev(IFDE_o),
        .DEEX_o(DEEX_i)
    );

    always_comb begin : PassDEDataToHU
        HU_in.EX_alusrcA = EXMEM_i.alu_srcA;
        HU_in.EX_alusrcB = EXMEM_i.alu_srcB;
    end

    DEEX_strct DEEX_module(
        .clk(CLK),
        .flush(HU_out.DEEX_fl),
        .enable(HU_out.DEEX_en),
        .DEEX_i(DEEX_i),
        .DEEX_o(DEEX_o)
    );

    /////////////////

    // EX stage ...

    EX_stage EXMEM_stg(
        .DEEX_prev(DEEX_o),
        .RS1(HU_in.EX_RS1),
        .RS2(HU_in.EX_RS2),
        .br_wires(br_wires),
        .br_status(br_status),
        .EXMEM_o(EXMEM_i)
    );

    EXMEM_strct EXMEM_module(
        .clk(CLK),
        .flush(HU_out.EXMEM_fl),
        .enable(HU_out.EXMEM_en),
        .EXMEM_i(EXMEM_i),
        .EXMEM_o(EXMEM_o)
    );

    // MCU IOBUS goes from Execute stage
    assign IOBUS_OUT = EXMEM_o.RS2_val;
    assign IOBUS_ADDR = EXMEM_o.alu_res;

    /////////////////

    // MEM stage ...

    MEM_stage MEMWB_stg(
        .EXMEM_prev(EXMEM_o),
        .MEMWB_o(MEMWB_i),
        .memRDEN2(HU_out.memRDEN2),
        .memWE2(HU_out.memWE2),
        .SIZE(HU_in.MEM_SIZE),
        .SIGN(HU_in.MEM_SIGN)
    );

    MEMWB_strct MEMWB_module(
        .clk(CLK),
        .flush(HU_out.MEMWB_fl),
        .enable(HU_out.MEMWB_en),
        .MEMWB_i(MEMWB_i),
        .MEMWB_o(MEMWB_o)
    );

    /////////////////

    // WB stage ...

    WB_stage Just_WB(
        .MEMWB_prev(MEMWB_o),
        .D2(HU_in.WB_DOUT2),
        .WD(HU_in.WB_WD)
    );















    // // CSR CSR(
    // //     .CSR_RST(reset),
    // //     .CSR_mret_exec(mret_exec),
    // //     .CSR_INT_TAKEN(int_taken),
    // //     .CSR_ADDR(de_ir[31:20]),
    // //     .CSR_WR_EN(csr_WE),
    // //     .CSR_PC(PC),
    // //     .CSR_WD(result),
    // //     .CSR_CLK(CLK),
    // //     .CSR_MSTATUS_B3(mstatus_b3),
    // //     .CSR_MEPC(mepc),
    // //     .CSR_MTVEC(mtvec),
    // //     .CSR_RD(csr_RD)
    // // );


    // // TODO: where is the mem_resp for WB? Answer: add with cache when that's done. 

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
