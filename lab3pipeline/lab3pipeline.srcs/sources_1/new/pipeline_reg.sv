`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:34:20 PM
// Design Name: Pipeline Register
// Module Name: pipeline_reg
// Project Name: Lab 3 Pipeline
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pipeline_reg
(
    input clk,
    input flush,
    input enable,
    input flush_bit, 
    input input_bit,
    output logic out_bit
);

always_ff @( posedge clk ) begin
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
