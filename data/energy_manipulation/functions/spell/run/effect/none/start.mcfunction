# <@> shape_marker or spell_marker

data remove storage energy_manipulation:op macro_data
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.caster_uuid set from storage energy_manipulation:op spell_effect.caster
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/none/debug with storage energy_manipulation:op macro_data

execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run tellraw @a[tag=xem.debug.effect] {"text":"no target"}
