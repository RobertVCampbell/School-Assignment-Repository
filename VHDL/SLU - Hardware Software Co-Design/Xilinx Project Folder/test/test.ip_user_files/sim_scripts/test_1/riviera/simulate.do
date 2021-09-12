onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+test_1 -L xil_defaultlib -L secureip -O5 xil_defaultlib.test_1

do {wave.do}

view wave
view structure

do {test_1.udo}

run -all

endsim

quit -force
