vlog tb.v ProgramCounter.v Adder.v instructionMemory.v InstructionFetch.v

vsim -novopt work.tb

view wave

add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/ins
add wave sim:/tb/insFetch/PC_In
add wave sim:/tb/insFetch/PC_Out

run 50ns