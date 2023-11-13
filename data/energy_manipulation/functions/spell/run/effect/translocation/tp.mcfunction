# get position
data modify storage energy_manipulation:op position_in set from storage energy_manipulation:op spell_effect.effect.position
function energy_manipulation:spell/run/getters/position/get
data modify storage energy_manipulation:op macro_input_position_in set from storage energy_manipulation:op initial_position
data modify storage energy_manipulation:op macro_input_position_in set from storage energy_manipulation:op position_out

# tp
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
function energy_manipulation:spell/run/getters/macro_input/position 
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op position_out_dimension
function energy_manipulation:spell/run/effect/translocation/tp2 with storage energy_manipulation:op macro_data
