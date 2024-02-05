# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0
# v 5.018

# My Variables

SOURCE_DIR ?= sources/modules
# TEST_DIR ?= tests


# Makefile

# defaults
SIM ?= verilator
TOPLEVEL_LANG ?= verilog

#!/bin/bash

# Define the target directory
VERILOG_INCLUDE_DIRS := $(SOURCE_DIR)/include
VERILOG_SOURCES := $(shell find $(SOURCE_DIR) -type f -name "*.sv")

# -o -name "*.mem
# Try linting?
# $(shell verilator --lint-only -I "$(VERILOG_INCLUDE_DIRS)" $(VERILOG_SOURCES))

# Opt: --error-limit 20 -Wno-DECLFILENAME
EXTRA_ARGS += --trace --trace-structs -Wno-DECLFILENAME -Wall -sv
WAVEFORM_FILENAME = dump
SIM_ARGS += --vcd=$(WAVEFORM_FILENAME).vcd

# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = Otter_MCU

# MODULE is the basename of the Python test file
MODULE = testbench

# Other variables
WAVES = 1
GUI = 1
SIM_BUILD = sim_build

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

all:
	echo "Sources include: $(VERILOG_SOURCES)"
	gtkwave $(WAVEFORM_FILENAME).vcd config.gtkw

lint-only:
	verilator -sv --lint-only -top $(TOPLEVEL) -I"$(VERILOG_INCLUDE_DIRS)" $(VERILOG_SOURCES)
