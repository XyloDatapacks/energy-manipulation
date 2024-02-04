#==<Translocation Ward Checks>==#

# find if there is a translocation ward in range of start position
execute at @s store result score #xem.trinket.translocation_ward.in_range xem.op run function energy_manipulation:trinket/translocation_ward/check/in_range

# if there is one, check if that ward is still in range at tp coord
execute if score #xem.trinket.translocation_ward.in_range xem.op matches 1 store result score #xem.trinket.translocation_ward.still_in_range xem.op run function energy_manipulation:trinket/translocation_ward/check/still_in_range with storage energy_manipulation:op translocation_ward_uuid
# if the ward was found but is no longer in range, then block tp
execute if score #xem.trinket.translocation_ward.in_range xem.op matches 1 if score #xem.trinket.translocation_ward.still_in_range xem.op matches 0 at @s run return run function energy_manipulation:trinket/translocation_ward/anchor_fx/start with storage energy_manipulation:op translocation_ward_uuid

#===============================#


#dismount
execute as @s if predicate xylo_library:riding run ride @s dismount

# set scoarch
execute at @s summon minecraft:marker run function energy_manipulation:spell/run/effect/translocation/scoarch/init

# tp
tp @s ~ ~ ~ ~ ~
# sound
execute at @s run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~
# tp time
scoreboard players operation #xem.spell.run.effect.translocation.scoarch_cooldown xem.op = #xlib.time xlib.op
scoreboard players add #xem.spell.run.effect.translocation.scoarch_cooldown xem.op 40
scoreboard players operation @s xem.spell.run.effect.translocation.scoarch_cooldown = #xem.spell.run.effect.translocation.scoarch_cooldown xem.op