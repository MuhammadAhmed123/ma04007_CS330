vlog testbench.v InstructionParser.v

vsim -novopt work.testbench

view wave

add wave sim:/testbench/ins
add wave sim:/testbench/opcode
add wave sim:/testbench/rd
add wave sim:/testbench/func3
add wave sim:/testbench/rs1
add wave sim:/testbench/rs2
add wave sim:/testbench/func7

run 200ns