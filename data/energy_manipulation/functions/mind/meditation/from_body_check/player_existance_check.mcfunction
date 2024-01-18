# -> {owner_uuid}

scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 0
$execute as $(owner_uuid) if entity @s[tag=xem.mind.expand.is_expanding] store success score #xem.mind.meditation.from_body_check.player_found xem.op run scoreboard players operation #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xem.mind.meditation.end_time

# kill if player not found or not expanding
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 0 on vehicle run function energy_manipulation:mind/meditation/exit/kill

# kill if player is expanding and end time != player end time (is an old clone left behind in unloaded chunks)
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 1 unless score #xem.mind.meditation.from_body_check.player_end_time xem.op = @s xem.mind.meditation.end_time on vehicle run function energy_manipulation:mind/meditation/exit/kill