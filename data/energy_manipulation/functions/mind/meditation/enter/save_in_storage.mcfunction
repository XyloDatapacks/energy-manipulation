# -> {player_hex_uuid}

#save data in player storage
$data modify storage energy_manipulation:data players[{uuid:$(player_hex_uuid)}].mind.meditation.clone set from storage xylo_library:op clone_data

