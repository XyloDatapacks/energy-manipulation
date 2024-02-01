# -> {player_hex_uuid}

# get mind data
data remove storage energy_manipulation:op meditation_data
$execute store success score #xem.mind.meditation.from_body_check.update_player_mind_data.get_clone xem.op run data modify storage energy_manipulation:op meditation_data set from storage energy_manipulation:data players[{uuid:$(player_hex_uuid)}].mind.meditation
execute unless score #xem.mind.meditation.from_body_check.update_player_mind_data.get_clone xem.op matches 1 run return 0

# quit if it is not correct clone
execute store result score #xem.mind.meditation.from_body_check.update_player_mind_data.clone_start xem.op run data get storage energy_manipulation:op meditation_data.start_time
execute unless score #xem.mind.meditation.from_body_check.update_player_mind_data.clone_start xem.op = @s xlib.internal.clone.generate.start_time run return 0

# update mind data
$data modify storage energy_manipulation:data players[{uuid:$(player_hex_uuid)}].mind.meditation merge from storage xylo_library:op clone_output_data

