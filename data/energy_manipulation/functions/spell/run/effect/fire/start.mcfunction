# <@> shape_marker or spell_marker

# fire entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data remove storage energy_manipulation:op macro_data
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 store result storage energy_manipulation:op macro_data.spell_power_dmg double 0.075 run scoreboard players get #xem.spell.run.effect.intensity xem.op
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 store result storage energy_manipulation:op macro_data.spell_power int 1.6 run scoreboard players add #xem.spell.run.effect.intensity xem.op 30
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.caster_uuid set from storage energy_manipulation:op spell_effect.caster
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/fire/fire with storage energy_manipulation:op macro_data

# fire block
execute if score xem.spell.run.effect.has_target_entity xem.op matches 0 run function energy_manipulation:spell/run/effect/fire/lit

