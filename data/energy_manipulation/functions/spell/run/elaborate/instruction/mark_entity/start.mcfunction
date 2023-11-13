# in: "energy_manipulation:op instruction"

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.index set from storage energy_manipulation:op selected_program[0].instruction.entity_index_save
data modify storage energy_manipulation:op macro_data.caster set from storage energy_manipulation:op running_spell_data.caster
function energy_manipulation:spell/run/elaborate/instruction/mark_entity/mark with storage energy_manipulation:op macro_data

