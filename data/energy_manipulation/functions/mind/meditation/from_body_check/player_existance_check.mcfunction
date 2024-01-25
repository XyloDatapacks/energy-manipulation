# -> {owner_uuid}

#==<DISPOSE>==#
# dispose checks (identical to body checks)

# get player existance and end time
scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 0
$execute as $(owner_uuid) if entity @s[gamemode=spectator,tag=xem.mind.expand.is_expanding] store success score #xem.mind.meditation.from_body_check.player_found xem.op run scoreboard players operation #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xem.mind.meditation.end_time
# kill if player not found or not expanding
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 0 run function xylo_library:internal/clone/dispose/_kill
# kill if player is expanding and end time != player end time (is an old clone left behind in unloaded chunks)
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 1 unless score #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xlib.internal.clone.generate.end_time run function xylo_library:internal/clone/dispose/_kill