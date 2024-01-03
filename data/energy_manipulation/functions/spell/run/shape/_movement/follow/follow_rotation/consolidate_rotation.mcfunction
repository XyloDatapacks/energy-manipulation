#-> {uuid}

$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"rotated_as"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow merge value {follow_rotation:"rotated as ",follow_rotation_target:"$(uuid)",follow_rotation2:" "}
$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"opposite_as"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow merge value {follow_rotation:"rotated as ",follow_rotation_target:"$(uuid)",follow_rotation2:" facing ^ ^ ^-1 "}
