data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:50,TargetEntities:true,MaxTravelDistance:8}
scoreboard players set $override_executing retina.__variable__ 1
tag @s add retina.executing
execute at @s anchored eyes positioned ^ ^ ^ run function xylo_retina:traverse/setup
tag @s remove retina.executing

#get hit coord
execute store success score #xem.jar_of_energy.place.can_place xem.op if data storage xylo_retina:output {Target:"BLOCK"} 
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data remove storage energy_manipulation:op macro_data 
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.x set from storage xylo_retina:output PlacingPosition[0]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.y set from storage xylo_retina:output PlacingPosition[1]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.z set from storage xylo_retina:output PlacingPosition[2]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run function energy_manipulation:jar_of_energy/place/coords with storage energy_manipulation:op macro_data
