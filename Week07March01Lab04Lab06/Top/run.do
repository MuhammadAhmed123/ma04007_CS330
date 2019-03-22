vlog tb.v InstructionParser.v registerFile.v top.v

vsim -novopt work.tb

view wave

add wave sim:/tb/ins
add wave sim:/tb/readData1
add wave sim:/tb/readData2

run 100ns