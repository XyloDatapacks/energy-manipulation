# <@> shape_marker or spell_marker

data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.spell_power int 0.08 run scoreboard players add #xem.spell.run.effect.intensity xem.op 30

# light entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 store result storage energy_manipulation:op macro_data.spell_power int 0.05 run scoreboard players add #xem.spell.run.effect.intensity xem.op 30
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op spell_effect.target_entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/light/glow with storage energy_manipulation:op macro_data

# light block
execute if score xem.spell.run.effect.has_target_entity xem.op matches 0 store result storage energy_manipulation:op macro_data.spell_power int 0.15 run scoreboard players operation #xem.spell.run.effect.intensity xem.op < #100 xconst
execute if score xem.spell.run.effect.has_target_entity xem.op matches 0 run function energy_manipulation:spell/run/effect/light/place with storage energy_manipulation:op macro_data

# sound
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run playsound energy_manipulation:spell.effect.light player @a ~ ~ ~ 0.3 1
