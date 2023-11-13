# execute instructions
data modify storage energy_manipulation:op selected_program set from storage energy_manipulation:op selected_concatenate.concatenate.program
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_program[0].instruction.value
function energy_manipulation:spell/run/elaborate/instruction with storage energy_manipulation:op macro_data
