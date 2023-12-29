# <@> spell_marker
# in: energy_manipulation:op spell_effect{effect, caster, target_entity}
# in: energy_manipulation:op initial_position
# in: energy_manipulation:op initial_rotation
# in: energy_manipulation:op running_spell_data

scoreboard players set xem.spell.run.effect.is_in_effect_context xem.op 1

#check target existence
scoreboard players set xem.spell.run.effect.has_target_entity xem.op 0 
function energy_manipulation:spell/run/effect/_target_exist with storage energy_manipulation:op spell_effect

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op spell_effect.effect.value
function energy_manipulation:spell/run/effect/sort with storage energy_manipulation:op macro_data
scoreboard players set xem.spell.run.effect.is_in_effect_context xem.op 0