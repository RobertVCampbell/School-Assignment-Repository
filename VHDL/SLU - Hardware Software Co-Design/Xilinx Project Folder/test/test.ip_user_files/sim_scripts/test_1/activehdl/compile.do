vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../bd/test_1/ip/test_1_test_0_0/sim/test_1_test_0_0.vhd" \
"../../../bd/test_1/sim/test_1.vhd" \


