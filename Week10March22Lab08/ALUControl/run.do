vlog tb.v ALUControl.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 100ns