data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.power int 0.0001 run scoreboard players get $strength delta.api.launch
function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data

execute store result score #xem.spell.run.effect.push.mob_add_motion_x xem.op run data get storage energy_manipulation:op temp_motion[0] 1000
execute store result score #xem.spell.run.effect.push.mob_add_motion_y xem.op run data get storage energy_manipulation:op temp_motion[1] 1000
execute store result score #xem.spell.run.effect.push.mob_add_motion_z xem.op run data get storage energy_manipulation:op temp_motion[2] 1000

data modify storage energy_manipulation:op temp_array set from entity @s Motion
execute store result score #xem.spell.run.effect.push.mob_motion_x xem.op run data get storage energy_manipulation:op temp_array[0] 1000
execute store result score #xem.spell.run.effect.push.mob_motion_y xem.op run data get storage energy_manipulation:op temp_array[1] 1000
execute store result score #xem.spell.run.effect.push.mob_motion_z xem.op run data get storage energy_manipulation:op temp_array[2] 1000

execute store result storage energy_manipulation:op temp_array[0] double 0.001 run scoreboard players operation #xem.spell.run.effect.push.mob_motion_x xem.op += #xem.spell.run.effect.push.mob_add_motion_x xem.op
execute store result storage energy_manipulation:op temp_array[1] double 0.001 run scoreboard players operation #xem.spell.run.effect.push.mob_motion_y xem.op += #xem.spell.run.effect.push.mob_add_motion_y xem.op
execute store result storage energy_manipulation:op temp_array[2] double 0.001 run scoreboard players operation #xem.spell.run.effect.push.mob_motion_z xem.op += #xem.spell.run.effect.push.mob_add_motion_z xem.op

data modify entity @s Motion set from storage energy_manipulation:op temp_array