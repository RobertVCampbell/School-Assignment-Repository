onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib test_1_opt

do {wave.do}

view wave
view structure
view signals

do {test_1.udo}

run -all

quit -force
