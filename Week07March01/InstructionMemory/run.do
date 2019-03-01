vlog tb.v instructionMemory.v

vsim -novopt work.tb

view wave

add wave sim:/tb/insAdd
add wave sim:/tb/ins

run 100ns