vlog tb.v controlUnit.v

vsim -novopt work.tb

view wave

add wave sim:/tb/opcode
add wave sim:/tb/ALUSrc
add wave sim:/tb/memToReg
add wave sim:/tb/regWrite
add wave sim:/tb/memRead
add wave sim:/tb/memWrite
add wave sim:/tb/branch
add wave sim:/tb/ALUOp

run 100ns