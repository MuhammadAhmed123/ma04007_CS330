#compiling design modules

vlog testbench.v mux.v

#starting simulation
vsim -novopt work.testbench

#changing view to wave
view wave

#Adding our wires to waves
add wave sim:/testbench/q01
add wave sim:/testbench/q02
add wave sim:/testbench/sel
add wave sim:/testbench/qout

run 200ns