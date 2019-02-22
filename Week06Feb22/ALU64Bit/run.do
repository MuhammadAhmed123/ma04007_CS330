vlog testBenchBit64.v ALU64Bit.v

vsim -novopt work.testBenchBit64

view wave

add wave sim:/testBenchBit64/a
add wave sim:/testBenchBit64/b
add wave sim:/testBenchBit64/aInvert
add wave sim:/testBenchBit64/bInvert
add wave sim:/testBenchBit64/carryIn
add wave sim:/testBenchBit64/operation
add wave sim:/testBenchBit64/result
add wave sim:/testBenchBit64/carryOut

run 200ns