#-> {position_x, position_y, position_z}

$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"toward"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "facing $(position_x) $(position_y) $(position_z) "
$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"away_from"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "facing $(position_x) $(position_y) $(position_z) facing ^ ^ ^-1 "
