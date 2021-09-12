vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../bd/test_1/ip/test_1_test_0_0/sim/test_1_test_0_0.vhd" \
"../../../bd/test_1/sim/test_1.vhd" \


