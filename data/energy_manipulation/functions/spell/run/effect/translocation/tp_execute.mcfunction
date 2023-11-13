# tp
tp @s ~ ~ ~ ~ ~
# sound
execute at @s run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~
# tp time
scoreboard players operation #xem.spell.run.effect.translocation.scoarch_cooldown xem.op = #xlib.time xlib.op
scoreboard players add #xem.spell.run.effect.translocation.scoarch_cooldown xem.op 40
scoreboard players operation @s xem.spell.run.effect.translocation.scoarch_cooldown = #xem.spell.run.effect.translocation.scoarch_cooldown xem.op