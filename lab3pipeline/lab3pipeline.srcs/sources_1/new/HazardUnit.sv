`timescale 1ns / 1ps

package HU;
    // Contains all the needed info for the HU FSM (conrol)
    typedef struct packed {
        logic memValid1;
    } HU_i;

    // All data to send to the pipeline for control (datapath)
    typedef struct packed {
        logic IFDE_en, DEEX_en, EXMEM_en, MEMWB_en;
        logic IFDE_flsh, DEEX_flsh, EXMEM_flsh, MEMWB_flsh;
    } HU_o;
endpackage

//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly, SLO
// Engineer: Brian Mere
// 
// Create Date: 05/30/2023 12:21:58 AM
// Design Name: 
// Module Name: HazardUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Hazard Unit that controls pipeline structs. 
// 
// 
//////////////////////////////////////////////////////////////////////////////////
import HU::*;

module HazardUnit(
        input reset,
        input HU_i m_i,
        output HU_o m_o
    );

    assign m_o.IFDE_en = 1;
    assign m_o.DEEX_en = 1;
    assign m_o.EXMEM_en = 1;
    assign m_o.MEMWB_en = 1;

    always_comb begin
        if(reset) begin
            m_o.IFDE_flsh = 1;
            m_o.DEEX_flsh = 1;
            m_o.EXMEM_flsh = 1;
            m_o.MEMWB_flsh = 1;
        end
        else begin
            m_o.IFDE_flsh = 0;
            m_o.DEEX_flsh = 0;
            m_o.EXMEM_flsh = 0;
            m_o.MEMWB_flsh = 0;
        end
    end
    
    

endmodule
