#compiling design modules
vlib work

vlog testbench.v RippleCarryCounter.v TFlipFlopModule.v DFlipFlopModule.v

#no optimization
vsim -novopt work.tb

#view waves
view wave

#Adding waves
add wave sim:/tb/clock
add wave sim:/tb/reset
add wave sim:/tb/q

run 200ns
