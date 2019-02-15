vlog tb.v DataExtractor.v

vsim -novopt work.tb

view wave

add wave sim:/tb/ins
add wave sim:/tb/immData

run 200ns