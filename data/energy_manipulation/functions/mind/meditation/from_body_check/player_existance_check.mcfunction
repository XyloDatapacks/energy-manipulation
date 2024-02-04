# -> {player_hex_uuid}

#==<DISPOSE>==#
# if player not found or not meditating, then kill clone
# if player found and meditating, if end times do not match, kill cause it is an old clone 
scoreboard players set #xem.mind.meditation.from_body_check.disposed xem.op 0

# get player existance and start_time
scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 0
$execute as $(player_hex_uuid) if entity @s[tag=xem.mind.meditation.is_meditating] store success score #xem.mind.meditation.from_body_check.player_found xem.op run scoreboard players operation #xem.mind.meditation.from_body_check.player_start_time xem.op = @s xem.mind.meditation.start_time
# kill if player not found or not expanding (if start time matches, then update mind player storage)
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 0 store success score #xem.mind.meditation.from_body_check.disposed xem.op run function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage energy_manipulation:op macro_data
execute if score #xem.mind.meditation.from_body_check.disposed xem.op matches 1 run return run function energy_manipulation:mind/meditation/from_body_check/update_player_mind_data/check with storage energy_manipulation:op macro_data
# kill if player is expanding and start_time != player start_time (is an old clone left behind in unloaded chunks)
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 1 unless score #xem.mind.meditation.from_body_check.player_start_time xem.op = @s xlib.internal.clone.generate.start_time run return run function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage energy_manipulation:op macro_data

#kill if time passed
execute if score #xlib.time xlib.op >= @s xlib.internal.clone.generate.end_time run return run function xylo_library:internal/clone/dispose/kill_from_marker/remove_from_player_storage_and_kill with storage energy_manipulation:op macro_data
# check for hibox entity
$execute unless entity @s[predicate=xylo_library:internal/clone/has_hitbox] as $(player_hex_uuid) run function energy_manipulation:mind/meditation/exit/start
