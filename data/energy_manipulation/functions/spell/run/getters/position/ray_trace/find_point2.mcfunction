# no block or entity check
$execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 0 if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 0 run return run execute positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

# TODO: expand hitbox 0.2
#raycast to find block or entity (excludes entities in a box 0.1 side)
data merge storage iris:settings {MaxRecursionDepth:50,Blacklist:"#iris:shape_groups/air",OverrideExecutingEntity:1b}
execute store result storage iris:settings TargetEntities byte 1 run scoreboard players get #xem.spell.run.getters.position.ray_trace.entities xem.op
execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 0 run data modify storage iris:settings Whitelist set value "#xylo_library:empty"
execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 1 run data remove storage iris:settings Whitelist
data modify storage iris:input MaxDistance set from storage energy_manipulation:op position_in.max_distance_int
execute if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 1 positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_interactive,dx=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] run tag @s add iris.executing
function iris:get_target
execute if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 1 positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_interactive,tag=iris.executing,dx=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] run tag @s remove iris.executing

#no result
$execute unless data storage iris:output TargetPosition.pos run return run execute positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

#result
data modify storage energy_manipulation:op position_out set from storage iris:output TargetPosition.pos