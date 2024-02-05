#-> {uuid}

#TODO: expand hitbox 0.2
data merge storage iris:settings {MaxRecursionDepth:100,TargetEntities:1b,Blacklist:"#iris:shape_groups/air"}
data remove storage iris:settings Whitelist
$execute as $(uuid) at @s anchored eyes positioned ^ ^ ^ run function iris:get_target

execute store success score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op if data storage iris:output TargetPosition.pos
execute if score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op matches 0 as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/rotated_as/xlm.rotate with storage energy_manipulation:op target_out[0]
execute if score #xem.spell.run.getters.direction.aim_point.loop_start.result xem.op matches 0 run return 0

# get current position
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
# get looking position
data modify storage energy_manipulation:op macro_input_position_in set from storage iris:output TargetPosition.pos
function energy_manipulation:spell/run/getters/macro_input/position

# get direction
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/aim_point/xlm.get_rotation with storage energy_manipulation:op macro_data
