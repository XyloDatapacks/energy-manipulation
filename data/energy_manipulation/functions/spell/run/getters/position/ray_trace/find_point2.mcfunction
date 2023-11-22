$execute if score #xem.spell.run.getters.position.ray_trace.blocks xem.op matches 0 if score #xem.spell.run.getters.position.ray_trace.entities xem.op matches 0 positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

#retina cast
data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:50,TargetEntities:true}
data modify storage xylo_retina:input MaxRecursionDepth set from storage energy_manipulation:op position_in.max_distance_int
scoreboard players set $expand_entity_check retina.__variable__ 96
function xylo_retina:traverse/setup

#no result
execute store success score #xem.spell.run.getters.position.ray_trace.find_point2.result xem.op if data storage xylo_retina:output ContactCoordinates
$execute if score #xem.spell.run.getters.position.ray_trace.find_point2.result xem.op matches 0 positioned ^ ^ ^$(max_distance_int) summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position
execute if score #xem.spell.run.getters.position.ray_trace.find_point2.result xem.op matches 0 run return 0

#result
data modify storage energy_manipulation:op position_out set from storage xylo_retina:output ContactCoordinates