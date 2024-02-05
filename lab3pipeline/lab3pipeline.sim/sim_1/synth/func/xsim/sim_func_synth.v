// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Mon Jun  5 17:06:30 2023
// Host        : DESKTOP-OJK9U19 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {C:/Users/brian/Documents/SchoolPapers/Repositories/CPE
//               333/CPE-333-Comp.-Arch-/lab3pipeline/lab3pipeline.sim/sim_1/synth/func/xsim/sim_func_synth.v}
// Design      : Otter_MCU
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* WIDTH = "32" *) 
(* NotValidForBitStream *)
module Otter_MCU
   (IOBUS_IN,
    RST,
    INTR,
    CLK,
    IOBUS_OUT,
    IOBUS_ADDR,
    IOBUS_WR);
  input [31:0]IOBUS_IN;
  input RST;
  input INTR;
  input CLK;
  output [31:0]IOBUS_OUT;
  output [31:0]IOBUS_ADDR;
  output IOBUS_WR;

  wire [31:0]IOBUS_ADDR;
  wire [31:0]IOBUS_OUT;
  wire IOBUS_WR;

  OBUF \IOBUS_ADDR_OBUF[0]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[0]));
  OBUF \IOBUS_ADDR_OBUF[10]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[10]));
  OBUF \IOBUS_ADDR_OBUF[11]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[11]));
  OBUF \IOBUS_ADDR_OBUF[12]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[12]));
  OBUF \IOBUS_ADDR_OBUF[13]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[13]));
  OBUF \IOBUS_ADDR_OBUF[14]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[14]));
  OBUF \IOBUS_ADDR_OBUF[15]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[15]));
  OBUF \IOBUS_ADDR_OBUF[16]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[16]));
  OBUF \IOBUS_ADDR_OBUF[17]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[17]));
  OBUF \IOBUS_ADDR_OBUF[18]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[18]));
  OBUF \IOBUS_ADDR_OBUF[19]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[19]));
  OBUF \IOBUS_ADDR_OBUF[1]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[1]));
  OBUF \IOBUS_ADDR_OBUF[20]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[20]));
  OBUF \IOBUS_ADDR_OBUF[21]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[21]));
  OBUF \IOBUS_ADDR_OBUF[22]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[22]));
  OBUF \IOBUS_ADDR_OBUF[23]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[23]));
  OBUF \IOBUS_ADDR_OBUF[24]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[24]));
  OBUF \IOBUS_ADDR_OBUF[25]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[25]));
  OBUF \IOBUS_ADDR_OBUF[26]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[26]));
  OBUF \IOBUS_ADDR_OBUF[27]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[27]));
  OBUF \IOBUS_ADDR_OBUF[28]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[28]));
  OBUF \IOBUS_ADDR_OBUF[29]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[29]));
  OBUF \IOBUS_ADDR_OBUF[2]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[2]));
  OBUF \IOBUS_ADDR_OBUF[30]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[30]));
  OBUF \IOBUS_ADDR_OBUF[31]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[31]));
  OBUF \IOBUS_ADDR_OBUF[3]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[3]));
  OBUF \IOBUS_ADDR_OBUF[4]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[4]));
  OBUF \IOBUS_ADDR_OBUF[5]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[5]));
  OBUF \IOBUS_ADDR_OBUF[6]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[6]));
  OBUF \IOBUS_ADDR_OBUF[7]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[7]));
  OBUF \IOBUS_ADDR_OBUF[8]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[8]));
  OBUF \IOBUS_ADDR_OBUF[9]_inst 
       (.I(1'b0),
        .O(IOBUS_ADDR[9]));
  OBUFT \IOBUS_OUT_OBUF[0]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[0]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[10]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[10]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[11]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[11]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[12]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[12]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[13]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[13]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[14]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[14]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[15]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[15]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[16]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[16]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[17]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[17]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[18]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[18]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[19]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[19]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[1]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[1]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[20]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[20]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[21]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[21]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[22]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[22]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[23]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[23]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[24]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[24]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[25]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[25]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[26]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[26]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[27]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[27]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[28]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[28]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[29]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[29]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[2]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[2]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[30]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[30]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[31]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[31]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[3]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[3]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[4]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[4]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[5]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[5]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[6]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[6]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[7]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[7]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[8]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[8]),
        .T(1'b1));
  OBUFT \IOBUS_OUT_OBUF[9]_inst 
       (.I(1'b0),
        .O(IOBUS_OUT[9]),
        .T(1'b1));
  OBUF IOBUS_WR_OBUF_inst
       (.I(1'b0),
        .O(IOBUS_WR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
