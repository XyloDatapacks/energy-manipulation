# -> {player_hex_uuid}

#==<DISPOSE>==#
# if player not found or not meditating, then kill stack
# if player found and meditating, if end times do not match, kill cause it is an old stack 
scoreboard players set #xem.mind.meditation.from_mind_check.disposed xem.op 0

# get player existance and end time
scoreboard players set #xem.mind.meditation.from_mind_check.player_found xem.op 0
$execute as $(player_hex_uuid) if entity @s[tag=xem.mind.meditation.is_meditating] store success score #xem.mind.meditation.from_mind_check.player_found xem.op run scoreboard players operation #xem.mind.meditation.from_mind_check.player_start_time xem.op = @s xem.mind.meditation.start_time
# kill if player not found or not expanding
execute if score #xem.mind.meditation.from_mind_check.player_found xem.op matches 0 store success score #xem.mind.meditation.from_mind_check.disposed xem.op on vehicle run function energy_manipulation:mind/meditation/from_mind_check/kill_stack
execute if score #xem.mind.meditation.from_mind_check.disposed xem.op matches 1 run return 1
# kill if player is expanding and end time != player end time (is an old stack left behind in unloaded chunks)
execute if score #xem.mind.meditation.from_mind_check.player_found xem.op matches 1 unless score #xem.mind.meditation.from_mind_check.player_start_time xem.op = @s xem.mind.meditation.start_time store success score #xem.mind.meditation.from_mind_check.disposed xem.op on vehicle run function energy_manipulation:mind/meditation/from_mind_check/kill_stack
execute if score #xem.mind.meditation.from_mind_check.disposed xem.op matches 1 run return 1

#kill if time passed
execute if score #xlib.time xlib.op >= @s xem.mind.meditation.end_time store success score #xem.mind.meditation.from_mind_check.disposed xem.op on vehicle run function energy_manipulation:mind/meditation/from_mind_check/kill_stack
execute if score #xem.mind.meditation.from_mind_check.disposed xem.op matches 1 run return 1

#==<MECHANIC>==#

# mount
execute unless predicate energy_manipulation:mind/meditation/from_mind_check/player_mounted run function energy_manipulation:mind/meditation/from_mind_check/mount_player with storage energy_manipulation:op macro_data

