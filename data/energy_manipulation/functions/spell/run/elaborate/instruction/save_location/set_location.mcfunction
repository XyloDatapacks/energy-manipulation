# -> {caster, index}

data modify storage energy_manipulation:op position_in set from storage energy_manipulation:op selected_program[0].instruction.position
function energy_manipulation:spell/run/getters/position/get

data remove storage energy_manipulation:op temp_data
data modify storage energy_manipulation:op temp_data.position set from storage energy_manipulation:op initial_position
data modify storage energy_manipulation:op temp_data.position set from storage energy_manipulation:op position_out
data modify storage energy_manipulation:op temp_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
data modify storage energy_manipulation:op temp_data.dimension set from storage energy_manipulation:op position_out_dimension
data modify storage energy_manipulation:op temp_data.direction set from storage energy_manipulation:op initial_rotation
$data modify storage energy_manipulation:data players[{uuid:"$(caster)"}].locations[{index:$(index)}] merge from storage energy_manipulation:op temp_data

