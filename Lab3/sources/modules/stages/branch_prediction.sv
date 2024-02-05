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
// This branch Prediction module ASSUMES that a branch isn't taken, and takes corrective action on fail. 
// 
//////////////////////////////////////////////////////////////////////////////////

`include "pipeline_structs_defs.svh"

module branch_prediction
#(parameter WIDTH = 32)
(
    input logic[2:0] pcSource, // always from DE stage, or equivalent
    output BRANCH_PREDICTION_STATUS_t pred_info
);

    // for now, assume always NOT branching (pcSource == 0), then 
    // if we were wrong in our prediction then we just let the HU 
    // know about the misstep... 

    // currently, just predict always NOT taken...
    always_comb begin : branchPredictionAlg
        pred_info.pc_sel = pcSource;

        if (pred_info.pc_sel == 0) begin // correct prediction
            pred_info.failed_prediction = 1'b0;
        end
        else begin // incorrect prediction, so then tell HU to deal with it...
            pred_info.failed_prediction = 1'b1;
        end
    end

endmodule
