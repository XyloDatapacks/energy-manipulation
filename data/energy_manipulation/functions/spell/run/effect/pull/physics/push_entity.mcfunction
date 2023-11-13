ride @s dismount
tag @s remove xem.spell.run.effect.pull

#pass motion to pull entity
data modify storage energy_manipulation:op temp_motion set value [0.0d,0.0d,0.0d]
execute store result storage energy_manipulation:op temp_motion[0] double 0.001 run scoreboard players get @s xem.spell.run.effect.pull.motion.x
execute store result storage energy_manipulation:op temp_motion[1] double 0.001 run scoreboard players get @s xem.spell.run.effect.pull.motion.y
execute store result storage energy_manipulation:op temp_motion[2] double 0.001 run scoreboard players get @s xem.spell.run.effect.pull.motion.z
data modify entity @s Motion set from storage energy_manipulation:op temp_motion 

tp @s ~ ~ ~