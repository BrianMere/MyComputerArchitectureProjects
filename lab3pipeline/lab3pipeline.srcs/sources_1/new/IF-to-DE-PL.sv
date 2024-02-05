`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 12:01:25 AM
// Design Name: 
// Module Name: IF-to-DE-PL
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

interface IFDE_itf #(parameter WIDTH = 32)
    
    // We define our struct externally. 

    IFDE in_packet, out_packet;

    modport in (input in_packet);
    modport out (output out_packet);
    
    
endinterface //



module IF-to-DE-PL();
endmodule
