`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:47:08 PM
// Design Name: 
// Module Name: pipeline_structs_defs
// Project Name: 
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

module pipeline_structs_defs(); 
endmodule

package stages;
    
    localparam WIDTH = 32;

    localparam NO_OP = 32'h13; // addi x0, x0, 0

    typedef struct packed {
        logic [WIDTH-1:0] U_TYPE;
        logic [WIDTH-1:0] I_TYPE;
        logic [WIDTH-1:0] S_TYPE;
        logic [WIDTH-1:0] J_TYPE;
        logic [WIDTH-1:0] B_TYPE;
    } IMMEDS;

    typedef struct packed {
        logic [WIDTH-1:0] jalr;
        logic [WIDTH-1:0] branch;
        logic [WIDTH-1:0] jal;
    } BRANCH_WIRES;

    typedef struct packed {
        logic [WIDTH-1:0] PC;
        // note that the memory module isn't included as it is its own thing
        logic flush_if_r; 
    } IFDE; // to instruction decode

    const IFDE N_IFDE = '{
        0, 1
    };

    typedef struct packed {
        logic [WIDTH-1:0] PC;
        logic regWrite;
        logic memWrite2;
        logic memRead2;
        logic [3:0] alu_fun;
        logic [1:0] alu_srcA;
        logic [2:0] alu_srcB;
        logic [1:0] rf_wr_sel;
        logic [6:0] opcode;
        IMMEDS imms;
        logic [WIDTH-1:0] RS1;
        logic [WIDTH-1:0] RS2;
        logic flush_de;
        logic [WIDTH-1:0] IR;
    } DEEX; // to instruction execute

    const DEEX N_DEEX = '{
        0, // PC
        0, // regWrite
        0, // memWrite2
        0, // memRead2
        0, // alu_fun
        0, // alu_srcA
        0, // alu_srcB
        0, // rf_wr_sel
        0, // opcode
        '{0,0,0,0,0},
        0,
        0,
        0,
        0
    };

    typedef struct packed {
        logic [WIDTH-1:0] PC;
        logic regWrite;
        logic memWrite2;
        logic memRead2;
        logic [WIDTH-1:0] frs2_ex; // gives the mem_rs2 for memory stuffs. 
        logic [WIDTH-1:0] alu_res;
        logic [WIDTH-1:0] IR;
        logic [1:0] rf_wr_sel;
    } EXMEM; // to data write (local registers)

    const EXMEM N_EXMEM = '{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
    };

    typedef struct packed {
        // again memory module connections handled in TOP
        logic [WIDTH-1:0] PC;
        logic [WIDTH-1:0] alu_res;
        logic [1:0] rf_wr_sel;
    } MEMWB; // to memory writeback (external)

    const MEMWB N_MEMWB = '{
        0,
        0,
        0
    };

endpackage

import stages::*;

module pipeline_strct #(
    type m_struct_type = IFDE,
    parameter size = $bits(m_struct_type)
)
(
    input clk, 
    input rst, 
    input enable, 
    input m_struct_type s_i,
    input m_struct_type flush_data, 
    output m_struct_type s_o
);

    logic [$bits(m_struct_type) - 1: 0] bits;

    generate
        genvar i;
        
        for(i = 0; i < size; i++) begin
            pipeline_reg m_regs (
                .clk(clk),
                .flush(rst),
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
    input rst, 
    input enable, 
    input IFDE IFDE_i,
    output IFDE IFDE_o
);

    pipeline_strct #(IFDE) m_strc(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .s_i(IFDE_i),
        .flush_data(N_IFDE),
        .s_o(IFDE_o)
    );

endmodule

module DEEX_strct (
    input clk, 
    input rst, 
    input enable, 
    input DEEX DEEX_i,
    output DEEX DEEX_o
);

    pipeline_strct #(DEEX) m_strc(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .s_i(DEEX_i),
        .flush_data(N_DEEX),
        .s_o(DEEX_o)
    );

endmodule

module EXMEM_strct (
    input clk, 
    input rst, 
    input enable, 
    input EXMEM EXMEM_i,
    output EXMEM EXMEM_o
);

    pipeline_strct #(EXMEM) m_strc(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .s_i(EXMEM_i),
        .flush_data(N_EXMEM),
        .s_o(EXMEM_o)
    );

endmodule

module MEMWB_strct (
    input clk, 
    input rst, 
    input enable, 
    input MEMWB MEMWB_i,
    output MEMWB MEMWB_o
);

    pipeline_strct #(MEMWB) m_strc(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .s_i(MEMWB_i),
        .flush_data(N_MEMWB),
        .s_o(MEMWB_o)
    );
endmodule



