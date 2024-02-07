# <@> shape_marker or spell_marker

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.caster_uuid set from storage energy_manipulation:op spell_effect.caster

# dmg entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 store result storage energy_manipulation:op macro_data.spell_power double 0.20 run scoreboard players get #xem.spell.run.effect.intensity xem.op
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/break/dmg with storage energy_manipulation:op macro_data

# break block
execute if score xem.spell.run.effect.has_target_entity xem.op matches 0 align x align y align z run function energy_manipulation:spell/run/effect/break/break with storage energy_manipulation:op macro_data
