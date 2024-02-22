#expire
execute if score @s xem.spell.run.effect.pull.entity.expire_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/effect/pull/physics/expire

#end physics
execute if predicate xylo_library:no_passengers run kill @s
execute if predicate xylo_library:no_passengers run return 0

execute at @s on passengers rotated as @s on vehicle run tp @s ~ ~ ~ ~ ~
execute if entity @s[tag=xem.spell.run.effect.pull.entity.done] run return 0

#==<Get Init>==#

#get position
data modify storage energy_manipulation:op temp_pos set from entity @s Pos
execute store result score #xem.grapple_pos_x xem.op run data get storage energy_manipulation:op temp_pos[0] 100
execute store result score #xem.grapple_pos_y xem.op run data get storage energy_manipulation:op temp_pos[1] 100
execute store result score #xem.grapple_pos_z xem.op run data get storage energy_manipulation:op temp_pos[2] 100

#get motion
data modify storage energy_manipulation:op temp_motion set from entity @s Motion
execute store result score #xem.grapple_o_motion_x xem.op run data get storage energy_manipulation:op temp_motion[0] 1000
execute store result score #xem.grapple_o_motion_y xem.op run data get storage energy_manipulation:op temp_motion[1] 1000
execute store result score #xem.grapple_o_motion_z xem.op run data get storage energy_manipulation:op temp_motion[2] 1000
#remove gravity influence
scoreboard players add #xem.grapple_o_motion_y xem.op 77

#==<Delta Pos / Distance anchor-grapple>==#
scoreboard players operation #xem.grapple_dist_x xem.op = @s xem.spell.run.effect.pull.ride.end_point.x
scoreboard players operation #xem.grapple_dist_y xem.op = @s xem.spell.run.effect.pull.ride.end_point.y
scoreboard players operation #xem.grapple_dist_z xem.op = @s xem.spell.run.effect.pull.ride.end_point.z

data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.x float 0.1 run scoreboard players operation #xem.grapple_dist_x xem.op -= #xem.grapple_pos_x xem.op
execute store result storage energy_manipulation:op macro_data.y float 0.1 run scoreboard players operation #xem.grapple_dist_y xem.op -= #xem.grapple_pos_y xem.op
execute store result storage energy_manipulation:op macro_data.z float 0.1 run scoreboard players operation #xem.grapple_dist_z xem.op -= #xem.grapple_pos_z xem.op
function xylo_library:utilities/distance/distance with storage energy_manipulation:op macro_data
execute store result score #xem.grapple_dist xem.op run data get storage xylo_library:op distance_out 10
execute if score #xem.grapple_dist xem.op matches ..60 run data modify entity @s {} merge value {Motion:[0.0d,0.0d,0.0d],NoGravity:1b}
execute if score #xem.grapple_dist xem.op matches ..60 run tag @s add xem.spell.run.effect.pull.entity.done
execute if score #xem.grapple_dist xem.op matches ..60 on passengers run function energy_manipulation:spell/run/effect/pull/physics/zero_motion 
execute if score #xem.grapple_dist xem.op matches ..60 run return 0

#max distance
execute unless score @s xem.spell.run.effect.pull.max_length = @s xem.spell.run.effect.pull.max_length run scoreboard players operation @s xem.spell.run.effect.pull.max_length = #xem.grapple_dist xem.op
scoreboard players operation #xem.grapple_dist_limited xem.op = #xem.grapple_dist xem.op
scoreboard players operation #xem.grapple_dist_limited xem.op < @s xem.spell.run.effect.pull.max_length

#coefficient
scoreboard players operation #xem.grapple_accell_coeff xem.op = #xem.grapple_dist_limited xem.op
scoreboard players operation #xem.grapple_accell_coeff xem.op *= #100 xconst
scoreboard players operation #xem.grapple_accell_coeff xem.op /= @s xem.spell.run.effect.pull.max_length
scoreboard players operation #xem.grapple_accell_coeff xem.op *= #xem.grapple_dist_limited xem.op
scoreboard players operation #xem.grapple_accell_coeff xem.op *= #100 xconst
scoreboard players operation #xem.grapple_accell_coeff xem.op /= #xem.grapple_dist xem.op
scoreboard players operation #xem.grapple_accell_coeff xem.op /= #100 xconst
scoreboard players add #xem.grapple_accell_coeff xem.op 40
scoreboard players operation #xem.grapple_accell_coeff xem.op < #100 xconst

#==< Direction Components (Normalized) >==#
scoreboard players operation #xem.grapple_dir_x xem.op = #xem.grapple_dist_x xem.op
scoreboard players operation #xem.grapple_dir_x xem.op *= #100 xconst
scoreboard players operation #xem.grapple_dir_x xem.op /= #xem.grapple_dist xem.op

scoreboard players operation #xem.grapple_dir_y xem.op = #xem.grapple_dist_y xem.op
scoreboard players operation #xem.grapple_dir_y xem.op *= #100 xconst
scoreboard players operation #xem.grapple_dir_y xem.op /= #xem.grapple_dist xem.op

scoreboard players operation #xem.grapple_dir_z xem.op = #xem.grapple_dist_z xem.op
scoreboard players operation #xem.grapple_dir_z xem.op *= #100 xconst
scoreboard players operation #xem.grapple_dir_z xem.op /= #xem.grapple_dist xem.op

#==< Motion Components (Normalized) >==#
scoreboard players operation #xem.grapple_motion_x xem.op = #xem.grapple_dir_x xem.op
scoreboard players operation #xem.grapple_motion_y xem.op = #xem.grapple_dir_y xem.op
scoreboard players operation #xem.grapple_motion_z xem.op = #xem.grapple_dir_z xem.op

#==< Compose Vector >==#

scoreboard players operation #xem.grapple_motion_x xem.op *= #5 xconst
scoreboard players operation #xem.grapple_motion_y xem.op *= #5 xconst
scoreboard players operation #xem.grapple_motion_z xem.op *= #5 xconst

scoreboard players operation #xem.grapple_o_motion_x xem.op += #xem.grapple_motion_x xem.op
scoreboard players operation #xem.grapple_o_motion_y xem.op += #xem.grapple_motion_y xem.op
scoreboard players operation #xem.grapple_o_motion_z xem.op += #xem.grapple_motion_z xem.op


#==<Set values>==#

scoreboard players operation #xem.grapple_o_motion_x xem.op *= #xem.grapple_accell_coeff xem.op
scoreboard players operation #xem.grapple_o_motion_y xem.op *= #xem.grapple_accell_coeff xem.op
scoreboard players operation #xem.grapple_o_motion_z xem.op *= #xem.grapple_accell_coeff xem.op
scoreboard players operation #xem.grapple_o_motion_x xem.op /= #100 xconst
scoreboard players operation #xem.grapple_o_motion_y xem.op /= #100 xconst
scoreboard players operation #xem.grapple_o_motion_z xem.op /= #100 xconst

#scoreboard 
execute on passengers run function energy_manipulation:spell/run/effect/pull/physics/pass_motion

#pass motion to pull entity
data modify storage energy_manipulation:op temp_motion set value [0.0d,0.0d,0.0d]
execute store result storage energy_manipulation:op temp_motion[0] double 0.001 run scoreboard players get #xem.grapple_o_motion_x xem.op
execute store result storage energy_manipulation:op temp_motion[1] double 0.001 run scoreboard players get #xem.grapple_o_motion_y xem.op
execute store result storage energy_manipulation:op temp_motion[2] double 0.001 run scoreboard players get #xem.grapple_o_motion_z xem.op
data modify entity @s Motion set from storage energy_manipulation:op temp_motion 
