# -> {out}

# get mind data
$execute store success score #xem.mind.meditation.exit.get_clone xem.op run data modify storage energy_manipulation:op meditation_data set from storage energy_manipulation:data players[{uuid:$(out)}].mind.meditation
execute unless score #xem.mind.meditation.exit.get_clone xem.op matches 1 run return 0

# kill clone
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.player_hex_uuid set from storage gu:main out
data modify storage energy_manipulation:op macro_data.marker_hex_uuid set from storage energy_manipulation:op meditation_data.clone.marker_hex_uuid
function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage energy_manipulation:op macro_data

# update mind data
data modify storage energy_manipulation:op meditation_data merge from storage xylo_library:op clone_output_data

# tp
function energy_manipulation:mind/meditation/exit/tp with storage energy_manipulation:op meditation_data.clone
