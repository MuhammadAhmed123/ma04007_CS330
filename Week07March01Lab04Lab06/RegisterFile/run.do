vlog tb.v registerFile.v

vsim -novopt work.tb

view wave

add wave sim:/tb/WriteData
add wave sim:/tb/RS1
add wave sim:/tb/RS2
add wave sim:/tb/RD
add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/RegWrite
add wave sim:/tb/ReadData1
add wave sim:/tb/ReadData2

run 55ns