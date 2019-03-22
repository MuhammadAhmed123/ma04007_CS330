vlog tb.v topControl.v controlUnit.v ALUControl.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 100ns