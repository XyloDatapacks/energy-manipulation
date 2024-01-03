#-> {uuid}

$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"rotated_as"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "rotated as $(uuid) "
$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"opposite_as"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow.follow_rotation set value "rotated as $(uuid) facing ^ ^ ^-1 "
