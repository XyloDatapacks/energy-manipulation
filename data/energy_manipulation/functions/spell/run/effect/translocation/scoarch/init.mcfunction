tag @s add xem.spell.run.effect.translocation.scoarch
data modify entity @s data.energy_manipulation.position set from storage energy_manipulation:op macro_input_position_in
data modify entity @s data.energy_manipulation.dimension set from storage energy_manipulation:op macro_data.dimension


execute store result score #xem.spell.run.effect.spell_power xem.op run data get storage energy_manipulation:op running_spell_data.spell_power 0.8
scoreboard players operation #xem.spell.run.effect.spell_power xem.op < #80 xconst

scoreboard players operation #xem.spell.run.effect.translocation.scoarch.expire_time xem.op = #xlib.time xlib.op
scoreboard players add #xem.spell.run.effect.translocation.scoarch.expire_time xem.op 100
scoreboard players operation #xem.spell.run.effect.translocation.scoarch.expire_time xem.op -= #xem.spell.run.effect.spell_power xem.op
scoreboard players operation @s xem.spell.shape.expire_time = #xem.spell.run.effect.translocation.scoarch.expire_time xem.op
