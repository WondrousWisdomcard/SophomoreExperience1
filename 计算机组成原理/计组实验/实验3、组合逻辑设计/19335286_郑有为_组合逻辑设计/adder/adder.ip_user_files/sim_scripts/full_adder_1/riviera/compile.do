vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../adder.srcs/sources_1/ip/full_adder_1/sources_1/new/full_adder.v" \
"../../../../adder.srcs/sources_1/ip/full_adder_1/sim/full_adder_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

