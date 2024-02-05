`include "pipeline_structs_defs.svh"

module DE_stage (
    input IFDE_t IFDE_prev,   // Data from IF part,
    output DEEX_t DEEX_o       // DE to EX struct
);

    logic [31:0] IR;
    assign IR = IFDE_prev.IR;

    always_comb begin : DATAInfo
        DEEX_o.IR = IFDE_prev.IR;
    end

    IMMED_GEN imm_generator(
        .INSTRUCT(IR[31:7]),
        .U_TYPE(DEEX_o.imms.U_TYPE),
        .I_TYPE(DEEX_o.imms.I_TYPE),
        .S_TYPE(DEEX_o.imms.S_TYPE),
        .J_TYPE(DEEX_o.imms.J_TYPE),
        .B_TYPE(DEEX_o.imms.B_TYPE)
    );
    

    always_comb begin : ExtraDecisions

        DEEX_o.PC = IFDE_prev.PC;
        DEEX_o.opcode = IR[6:0];
        // further PCWrite should just always be on depending on the bigger HU.

        case(DEEX_o.opcode)
            7'b0000011: begin // lb, lbu, lh, lhu, lw
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 1;
            end
            7'b0010011: begin // addi, andi, ... (all immediate ones)
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b0110011: begin // add, and, or, sll, slt, ...
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b0110111: begin // only for lui
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b0110111: begin // only for auipc
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b1100011: begin // beq, bge, bgeu, blt, bltu, and bne
                DEEX_o.regWrite  = 0;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b1101111: begin // just jal
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b1100111: begin // just jalr
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            7'b0100011: begin // sb, sh, sw
                DEEX_o.regWrite  = 1;
                DEEX_o.memWrite2 = 1;
                DEEX_o.memRead2  = 0;
            end
            7'b1110011: begin // csrrw, mret
                // WE ARENT USING THESE SO JUST HAVE THIS BE NOTHING...
                DEEX_o.regWrite  = 0;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
            default: begin
                DEEX_o.regWrite  = 0;
                DEEX_o.memWrite2 = 0;
                DEEX_o.memRead2  = 0;
            end
        endcase
    end
    
endmodule
