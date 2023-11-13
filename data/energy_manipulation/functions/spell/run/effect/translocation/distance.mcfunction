#out: "#xem.spell.run.effect.translocation.distance xem.op"

execute store result score #xem.spell.run.effect.translocation.dx xem.op run data get storage energy_manipulation:op position_x[0]
execute store result score #xem.spell.run.effect.translocation.dy xem.op run data get storage energy_manipulation:op position_y[1]
execute store result score #xem.spell.run.effect.translocation.dz xem.op run data get storage energy_manipulation:op position_z[2]

data modify storage energy_manipulation:op translocation_initial_pos set from entity @s Pos
execute store result score #xem.spell.run.effect.translocation.x xem.op run data get storage energy_manipulation:op translocation_initial_pos[0]
execute store result score #xem.spell.run.effect.translocation.y xem.op run data get storage energy_manipulation:op translocation_initial_pos[1]
execute store result score #xem.spell.run.effect.translocation.z xem.op run data get storage energy_manipulation:op translocation_initial_pos[2]

data remove storage energy_manipulation:op translocation_distance
execute store result storage energy_manipulation:op translocation_distance.x float 1 run scoreboard players operation #xem.spell.run.effect.translocation.dx xem.op -= #xem.spell.run.effect.translocation.x xem.op
execute store result storage energy_manipulation:op translocation_distance.y float 1 run scoreboard players operation #xem.spell.run.effect.translocation.dy xem.op -= #xem.spell.run.effect.translocation.y xem.op
execute store result storage energy_manipulation:op translocation_distance.z float 1 run scoreboard players operation #xem.spell.run.effect.translocation.dz xem.op -= #xem.spell.run.effect.translocation.z xem.op
function xylo_library:utilities/distance/distance with storage energy_manipulation:op translocation_distance

execute store result score #xem.spell.run.effect.translocation.distance xem.op run data get storage xylo_library:op distance_out
