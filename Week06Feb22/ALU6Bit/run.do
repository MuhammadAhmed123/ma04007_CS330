vlog testBenchBit6.v ALU6Bit.v ALU1Bit.v

vsim -novopt work.testBenchBit6

view wave

add wave sim:/testBenchBit6/a
add wave sim:/testBenchBit6/b
add wave sim:/testBenchBit6/aInvert
add wave sim:/testBenchBit6/bInvert
add wave sim:/testBenchBit6/carryIn
add wave sim:/testBenchBit6/operation
add wave sim:/testBenchBit6/result
add wave sim:/testBenchBit6/carryOut

run 200ns