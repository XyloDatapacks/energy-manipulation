# no block or entity check
$execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 0 if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 0 run return run execute positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

#raycast to find block or entity (excludes entities in a box 0.1 side)
data merge storage xylo_iris:settings {MaxRecursionDepth:50,Blacklist:"#xylo_iris:shape_groups/air",OverrideExecutingEntity:1b,EntityHitboxTollerance:0.2}
execute store result storage xylo_iris:settings TargetEntities byte 1 run scoreboard players get #xem.spell.run.getters.position.ray_trace.entities xem.op
execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 0 run data modify storage xylo_iris:settings Whitelist set value "#xylo_library:empty"
execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 1 run data remove storage xylo_iris:settings Whitelist
data modify storage xylo_iris:input MaxDistance set from storage energy_manipulation:op position_in.max_distance_int
execute if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 1 positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_interactive,dx=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] run tag @s add xylo_iris.executing
function xylo_iris:get_target
execute if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 1 positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_interactive,tag=xylo_iris.executing,dx=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] run tag @s remove xylo_iris.executing

#no result
$execute unless data storage xylo_iris:output TargetPosition.pos run return run execute positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

#result
data modify storage energy_manipulation:op position_out set from storage xylo_iris:output TargetPosition.pos