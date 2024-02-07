data merge storage xylo_iris:settings {MaxRecursionDepth:50,MaxDistance:5,TargetEntities:1b,Blacklist:"#xylo_iris:shape_groups/air"}
data remove storage xylo_iris:settings Whitelist
execute at @s anchored eyes positioned ^ ^ ^ run function xylo_iris:get_target

#get hit coord
execute store success score #xem.jar_of_energy.place.can_place xem.op if data storage xylo_iris:output {TargetType:"BLOCK"} 
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data remove storage energy_manipulation:op macro_data 
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.x set from storage xylo_iris:output PlacePosition.tile[0]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.y set from storage xylo_iris:output PlacePosition.tile[1]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run data modify storage energy_manipulation:op macro_data.z set from storage xylo_iris:output PlacePosition.tile[2]
execute if score #xem.jar_of_energy.place.can_place xem.op matches 1 run function energy_manipulation:jar_of_energy/place/coords with storage energy_manipulation:op macro_data
