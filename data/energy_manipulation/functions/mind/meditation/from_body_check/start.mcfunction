# kill if player not found or not expanding || kill if player is expanding and end time != player end time (is an old clone left behind in unloaded chunks)
data modify storage energy_manipulation:op macro_data set from entity @s data.xylo_library.clone
function energy_manipulation:mind/meditation/from_body_check/player_existance_check with storage energy_manipulation:op macro_data
