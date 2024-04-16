`timescale 1ns / 1ps

`include "pipeline_structs_defs.svh"

module HazardUnit
#(parameter WIDTH = 32)
(
    input CLK,
    input RST,
    input HU_i_t m_i,
    output HU_o_t m_o
);

    // defaults...
    initial begin
        m_o.pc_enable = 1;
        m_o.memRDEN1 = 1;
        m_o.memRDEN2 = 0;
        m_o.memWE2 = 0;
        m_o.if_pc_selection = 0;
    end

    always_ff @ (posedge CLK) begin : ResetFlow
        // when a reset is unblocked, we need to ease the reset signals over all 
        // stages such that they all have a nop in them, and NOT our starting IR.
        
        logic [1:0] counter;

        if (RST) begin // on continuous RST, keep the defaults. 
            
            m_o.IFDE_fl <=  0;
            m_o.DEEX_fl <=  1;
            m_o.EXMEM_fl <= 1;
            m_o.MEMWB_fl <= 1;

            m_o.IFDE_en <=  1;
            m_o.DEEX_en <=  0;
            m_o.EXMEM_en <= 0;
            m_o.MEMWB_en <= 0;

            counter <= 0;
        end
        else begin // RST == 0

            m_o.IFDE_fl <=  0;
            m_o.DEEX_fl <=  0;
            m_o.EXMEM_fl <= 0;
            m_o.MEMWB_fl <= 0;

            m_o.IFDE_en <=  1; // we start with this one
            m_o.DEEX_en <=  1;
            m_o.EXMEM_en <= 1;
            m_o.MEMWB_en <= 1;

        end
    end
        
    // Forwarding logic

    

    

endmodule
