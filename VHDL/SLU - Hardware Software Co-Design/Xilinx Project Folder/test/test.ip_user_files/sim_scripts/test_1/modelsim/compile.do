vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../bd/test_1/ip/test_1_test_0_0/sim/test_1_test_0_0.vhd" \
"../../../bd/test_1/sim/test_1.vhd" \


