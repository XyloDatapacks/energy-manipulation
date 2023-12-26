#==<Translocation Ward Checks>==#

# get
execute at @s run function energy_manipulation:trinket/translocation_ward/check/in_range

# check
scoreboard players set #xem.trinket.translocation_ward.still_in_range xem.op 1
function energy_manipulation:trinket/translocation_ward/check/still_in_range with storage energy_manipulation:op translocation_ward_uuid
execute if score #xem.trinket.translocation_ward.still_in_range xem.op matches 0 at @s run function energy_manipulation:trinket/translocation_ward/anchor_fx/start with storage energy_manipulation:op translocation_ward_uuid
execute if score #xem.trinket.translocation_ward.still_in_range xem.op matches 0 run return 0

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