vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../mul_4.srcs/sources_1/ip/full_adder_0/sources_1/new/full_adder.v" \
"../../../../mul_4.srcs/sources_1/ip/full_adder_0/sim/full_adder_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

