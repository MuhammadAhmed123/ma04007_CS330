vlog tb.v memory.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*
add wave sim:/tb/myMemory/mem

run 100ns