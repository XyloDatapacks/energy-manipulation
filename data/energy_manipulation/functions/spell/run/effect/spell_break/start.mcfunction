# <@> shape_marker or spell_marker

# push entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data remove storage energy_manipulation:op macro_data
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/spell_break/destroy_spell with storage energy_manipulation:op macro_data

# sound
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run playsound energy_manipulation:spell.effect.spell_break player @a ~ ~ ~ 1 1
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run particle minecraft:glow ~ ~ ~ 0.1 0.1 0.1 1 5 force
