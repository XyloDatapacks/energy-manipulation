# -> {owner_uuid}

#==<DISPOSE>==#
# if player not found use dispose/_kill instead of the usual clone kill procedure, cause i want the storage to remain intact.
# if player found i use kill_from_marker, cause it is an old clone and i don't care about the storage

# get player existance and end time
scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 0
$execute as $(owner_uuid) if entity @s[gamemode=spectator,tag=xem.mind.expand.is_expanding] store success score #xem.mind.meditation.from_body_check.player_found xem.op run scoreboard players operation #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xem.mind.meditation.end_time
# kill if player not found or not expanding
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 0 on vehicle run function xylo_library:internal/clone/dispose/_kill
# kill if player is expanding and end time != player end time (is an old clone left behind in unloaded chunks)
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 1 unless score #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xlib.internal.clone.generate.end_time on vehicle run function xylo_library:internal/clone/dispose/_kill