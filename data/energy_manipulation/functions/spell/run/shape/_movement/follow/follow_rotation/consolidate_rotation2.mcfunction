#-> {uuid, anchor}

$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"toward"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow merge value {follow_rotation:"facing entity ",follow_rotation_target:"$(uuid)",follow_rotation2:" $(anchor) "}
$execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.follow_rotation{value:"away_from"} run data modify storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.consolidated_follow merge value {follow_rotation:"facing entity ",follow_rotation_target:"$(uuid)",follow_rotation2:" $(anchor) facing ^ ^ ^-1 "}
