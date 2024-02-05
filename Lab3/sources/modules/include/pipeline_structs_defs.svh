`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly: SLO
// Engineer: Brian Mere
// 
// Create Date: 05/24/2023 11:47:08 PM
// Design Name: 
// Module Name: pipeline_structs_defs
// Project Name: Lab 3 Pipeline
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// File: module_def.v
`ifndef STAGES
`define STAGES

package stages;
    
    localparam WIDTH = 32;

    localparam NO_OP = 32'h13; // addi x0, x0, 0

    typedef struct packed {
        logic [WIDTH-1:0] U_TYPE;
        logic [WIDTH-1:0] I_TYPE;
        logic [WIDTH-1:0] S_TYPE;
        logic [WIDTH-1:0] J_TYPE;
        logic [WIDTH-1:0] B_TYPE;
    } IMMEDS_t;

    typedef struct packed {
        logic [WIDTH-1:0] jalr;
        logic [WIDTH-1:0] branch;
        logic [WIDTH-1:0] jal;
    } BRANCH_WIRES_t;

    typedef struct packed {
        logic br_eq;
        logic br_lt;
        logic br_ltu;
    } BRANCH_STATUS_t;

    typedef struct packed {
        logic failed_prediction; // true if we predicted incorrectly
        logic [2:0] pc_sel; // selection to pass to PC MUX SEL.
    } BRANCH_PREDICTION_STATUS_t;

    typedef struct packed {
        logic [WIDTH-1:0] PC;
        logic [WIDTH-1:0] IR;
    } IFDE_t; // to instruction decode

    const IFDE_t N_IFDE = '{IR: NO_OP, default: 0};

    typedef struct packed {

        // Memory and misc.
        logic [WIDTH-1:0] PC;
        logic [6:0] opcode;
        logic regWrite;
        logic memWrite2;
        logic memRead2;

        // DATA info
        IMMEDS_t imms;
        logic [WIDTH-1:0] IR; // note that having the IR here, we can 
        // decode a lot of other information at a later time...

    } DEEX_t; // to instruction execute

    const DEEX_t N_DEEX = '{default:0, IR: NO_OP};

    typedef struct packed {
        DEEX_t DEEX_prev;

        // ALU and REG control info
        logic [3:0] alu_fun;
        logic [1:0] alu_srcA;
        logic [2:0] alu_srcB;
        logic [1:0] rf_wr_sel;
        logic [2:0] pcSource;

        // new signals
        logic [WIDTH-1:0] alu_res;
        logic [WIDTH-1:0] RS1_val;
        logic [WIDTH-1:0] RS2_val;
    } EXMEM_t; // to data write (local registers)

    const EXMEM_t N_EXMEM = '{default:0, DEEX_prev: N_DEEX};

    typedef struct packed {
        // again memory module connections handled in TOP
        EXMEM_t EXMEM_prev;
    } MEMWB_t; // to memory writeback (external)

    const MEMWB_t N_MEMWB = '{default:0, EXMEM_prev: N_EXMEM};

    // Contains all the needed info for the HU FSM (control)
    typedef struct packed {
        IFDE_t IFDE_data;
        DEEX_t DEEX_data;
        EXMEM_t EXMEM_data;
        MEMWB_t MEMWB_data;

        // input info, mainly from DE as it's the one stage that has it's data internal pretty much
        // we prefix what stage each piece of data comes from, then what that data is

        logic [WIDTH-1:0] EX_IR;
        logic [WIDTH-1:0] EX_RS1, EX_RS2;
        logic [1:0] EX_alusrcA;
        logic [2:0] EX_alusrcB;
        logic mem_err; // errors when the memory fails. Not from any stage...
        logic [13:12] MEM_SIZE;
        logic MEM_SIGN;
        logic [WIDTH-1:0] WB_DOUT2;
        logic [WIDTH-1:0] WB_WD;

        BRANCH_PREDICTION_STATUS_t pred_status;
    } HU_i_t;

    // All data to send to the pipeline for control (datapath)
    typedef struct packed {
        // whether or not to stall (0) or not (1). Requires that flush isn't on.
        logic IFDE_en; 
        logic DEEX_en; 
        logic EXMEM_en; 
        logic MEMWB_en; 

        // whether or not to flush the data and get a NOP in our register.
        logic IFDE_fl;
        logic DEEX_fl; 
        logic EXMEM_fl;
        logic MEMWB_fl; 

        logic [2:0] if_pc_selection; // we want to control the PC selection AND flush data on certain branches
        
        // when we do forwarding we'll add other data here for outputting that data around in the MCU...
        logic pc_enable;
        logic memRDEN1;
        logic memRDEN2;
        logic memWE2; 
        

    } HU_o_t;

endpackage

import stages::*;

module pipeline_strct #(
    type m_struct_type
)
(
    input clk, 
    input flush, 
    input enable, 
    input m_struct_type s_i,
    input m_struct_type flush_data, 
    output m_struct_type s_o
);

    logic [$bits(m_struct_type) - 1: 0] bits;

    generate
        genvar i;
        
        for(i = 0; i < $bits(m_struct_type); i++) begin
            pipeline_reg m_regs (
                .clk(clk),
                .flush(flush),
                .enable(enable),
                .flush_bit(flush_data[i]),
                .input_bit(s_i[i]),
                .out_bit(s_o[i])
            );
        end
    endgenerate
endmodule

module IFDE_strct (
    input clk, 
    input flush, 
    input enable, 
    input IFDE_t IFDE_i,
    output IFDE_t IFDE_o
);

    pipeline_strct #(IFDE_t) m_strc(
        .clk(clk),
        .flush(flush),
        .enable(enable),
        .s_i(IFDE_i),
        .flush_data(N_IFDE),
        .s_o(IFDE_o)
    );

endmodule

module DEEX_strct (
    input clk, 
    input flush, 
    input enable, 
    input DEEX_t DEEX_i,
    output DEEX_t DEEX_o
);

    pipeline_strct #(DEEX_t) m_strc(
        .clk(clk),
        .flush(flush),
        .enable(enable),
        .s_i(DEEX_i),
        .flush_data(N_DEEX),
        .s_o(DEEX_o)
    );

endmodule

module EXMEM_strct (
    input clk, 
    input flush, 
    input enable, 
    input EXMEM_t EXMEM_i,
    output EXMEM_t EXMEM_o
);

    pipeline_strct #(EXMEM_t) m_strc(
        .clk(clk),
        .flush(flush),
        .enable(enable),
        .s_i(EXMEM_i),
        .flush_data(N_EXMEM),
        .s_o(EXMEM_o)
    );

endmodule

module MEMWB_strct (
    input clk, 
    input flush, 
    input enable, 
    input MEMWB_t MEMWB_i,
    output MEMWB_t MEMWB_o
);

    pipeline_strct #(MEMWB_t) m_strc(
        .clk(clk),
        .flush(flush),
        .enable(enable),
        .s_i(MEMWB_i),
        .flush_data(N_MEMWB),
        .s_o(MEMWB_o)
    );
endmodule

module pipeline_reg
(
    input clk,              
    input flush,            // flag to flush this register or not
    input enable,           // enable allows the register to change state. Otherwise, data is maintained.
    input flush_bit,        // data to flush to (ie: a default data) 
    input input_bit,        // data to potentially store
    output logic out_bit    // data internally stored
);

always_ff @( negedge clk ) begin
    if (enable) begin
        if(flush) begin
            out_bit <= flush_bit;
        end
        else begin
            out_bit <= input_bit;
        end
    end
    else begin
        out_bit <= out_bit;
    end
end
    

endmodule

`endif // STAGES



