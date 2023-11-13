# in: "energy_manipulation:op instruction"

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.index set from storage energy_manipulation:op selected_program[0].instruction.location_index
data modify storage energy_manipulation:op macro_data.caster set from storage energy_manipulation:op running_spell_data.caster
function energy_manipulation:spell/run/elaborate/instruction/save_location/set_location with storage energy_manipulation:op macro_data

