#-> {uuid, anchor}

$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"toward"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "facing entity $(uuid) $(anchor) "
$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"away_from"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "facing entity $(uuid) $(anchor) facing ^ ^ ^-1 "
