vlog tb.v Adder.v ALU64Bit.v ALUControl.v controlUnit.v dataMemory.v ImmediateGenerator.v instructionMemory.v InstructionParser.v mux.v processor.v ProgramCounter.v registerFile.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 100ns