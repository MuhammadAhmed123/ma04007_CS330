#compiling design modules

vlog Ex_testbench.v Ex_RippleCarryCounter.v Ex_TFlipFlopModule.v Ex_DFlipFlopModule.v

#no optimization
vsim -novopt work.tb

#view waves
view wave

#Adding waves
add wave sim:/tb/clock
add wave sim:/tb/reset
add wave sim:/tb/q

run 500ns