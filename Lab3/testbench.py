# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# test_my_design.py (simple)

import cocotb
from cocotb.triggers import FallingEdge, Timer, RisingEdge
from cocotb.clock import Clock

@cocotb.test()
async def run_clock(dut):
    """Run some clock on code in the MCU"""

    clk = cocotb.start_soon(Clock(dut.CLK, 1, units="ns").start())

    # Define Intitial Values here (can keep undefined)
    # dut.btnc =0
    # dut.ps2clk=0
    # dut.ps2data=0
    # dut.vga_hs=0
    # dut.vga_vs=0
    # dut.anodes = 4
    # dut.cathodes = 8
    # dut.vga_rgb = 8
    # dut.sw = 16
    # dut.leds = 16

    dut.RST = 1
    for i in range(10):
        await RisingEdge(dut.CLK)
    await Timer(0.25, "ns")
    dut.RST = 0
    for i in range(10000):
        await FallingEdge(dut.CLK)

    