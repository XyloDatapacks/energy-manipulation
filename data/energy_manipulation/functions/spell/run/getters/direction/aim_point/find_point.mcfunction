#-> {uuid}

#retina cast
data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:60,TargetEntities:true,MaxTravelDistance:50}
scoreboard players set $override_executing retina.__variable__ 1
scoreboard players set $expand_entity_check retina.__variable__ 96
$execute as $(uuid) run tag @s add retina.executing
$execute as $(uuid) at @s anchored eyes positioned ^ ^ ^ run function xylo_retina:traverse/setup
$execute as $(uuid) run tag @s remove retina.executing
$execute as $(uuid) run say hi

execute store success score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op if data storage xylo_retina:output ContactCoordinates
execute if score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op matches 0 as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/rotated_as/xlm.rotate with storage energy_manipulation:op target_out[0]
execute if score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op matches 0 run return 0

# get current position
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
# get looking position
data modify storage energy_manipulation:op macro_input_position_in set from storage xylo_retina:output ContactCoordinates
function energy_manipulation:spell/run/getters/macro_input/position

# get direction
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/aim_point/xlm.get_rotation with storage energy_manipulation:op macro_data
