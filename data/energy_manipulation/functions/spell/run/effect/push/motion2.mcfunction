# -> {uuid, rot_x, rot_y}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

# sound
playsound energy_manipulation:spell.effect.push player @a ~ ~ ~ 1 1
particle minecraft:sonic_boom ~ ~ ~ 0.1 0.1 0.1 1 0 force

#==<Validation Exit>==#
execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0
execute if score #xem.spell.run.effect.validate_target xem.op matches -3..-1 run return 0
#=====================#

#dismount
$execute as $(uuid) if predicate xylo_library:riding run ride @s dismount

# push
scoreboard players set $strength delta.api.launch 500
scoreboard players operation $strength delta.api.launch *= #xem.spell.run.effect.intensity xem.op
scoreboard players add $strength delta.api.launch 10000
scoreboard players operation $strength delta.api.launch < #50000 xconst

$execute as $(uuid) rotated $(rot_x) $(rot_y) if entity @s[type=minecraft:player] run function delta:api/launch_looking
$execute as $(uuid) rotated $(rot_x) $(rot_y) if entity @s[type=!minecraft:player] run function energy_manipulation:spell/run/effect/push/entity_motion/calc

