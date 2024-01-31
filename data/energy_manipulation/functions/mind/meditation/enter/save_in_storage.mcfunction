# -> {player_hex_uuid}

#save data in player storage
$data modify storage energy_manipulation:data players[{uuid:$(player_hex_uuid)}].mind.meditation set from storage energy_manipulation:op meditation_data

