`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Brian Mere
// 
// Create Date: 05/25/2023 02:05:36 PM
// Design Name: 
// Module Name: branch_prediction
// Project Name: Lab 3 Pipeline
// 
//////////////////////////////////////////////////////////////////////////////////

module branch_prediction
#(parameter WIDTH = 32)
(
        input br_res_ex,
        input [WIDTH-1:0] br_target_ex,
        output logic[2:0] pc_sel, 
        output logic [WIDTH-1:0] jalr,
        output logic [WIDTH-1:0] branch,
        output logic [WIDTH-1:0] jal
    );


    assign jalr = '0;
    assign branch = '0;
    assign jal = '0;

    assign pc_sel = 0;

endmodule
