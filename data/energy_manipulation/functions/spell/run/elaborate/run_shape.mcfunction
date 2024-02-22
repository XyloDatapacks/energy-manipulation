# run shape
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_concatenate.concatenate.shape.value
function energy_manipulation:spell/run/getters/macro_input/initial_position
function energy_manipulation:spell/run/getters/macro_input/initial_rotation
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
function energy_manipulation:spell/run/shape/sort_generate with storage energy_manipulation:op macro_data
