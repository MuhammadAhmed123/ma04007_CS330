vlog testBench.v ALU1Bit.v

vsim -novopt work.testBench

view wave

add wave sim:/testBench/a
add wave sim:/testBench/b
add wave sim:/testBench/aInvert
add wave sim:/testBench/bInvert
add wave sim:/testBench/carryIn
add wave sim:/testBench/operation
add wave sim:/testBench/result
add wave sim:/testBench/carryOut

run 200ns