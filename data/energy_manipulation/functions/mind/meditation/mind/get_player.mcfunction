#-> {owner_uuid, horse_uuid, shulker_uuid}

#==<DISPOSE>==#
# dispose checks (identical to body checks except executed entity)

# get player existance and end time
scoreboard players set #xem.mind.meditation.mind.player_found xem.op 0
$execute as $(owner_uuid) if entity @s[gamemode=spectator,tag=xem.mind.expand.is_expanding] store success score #xem.mind.meditation.mind.player_found xem.op run scoreboard players operation #xem.mind.meditation.mind.player_end_time xem.op = @s xem.mind.meditation.end_time
# kill if player not found or not expanding
execute if score #xem.mind.meditation.mind.player_found xem.op matches 0 run function energy_manipulation:mind/meditation/mind/kill_mind with entity @s data.energy_manipulation.meditation
# kill if player is expanding and end time != player end time (is an old clone left behind in unloaded chunks)
execute if score #xem.mind.meditation.mind.player_found xem.op matches 1 unless score #xem.mind.meditation.mind.player_end_time xem.op = @s xem.mind.meditation.end_time run function energy_manipulation:mind/meditation/mind/kill_mind with entity @s data.energy_manipulation.meditation

#==<ACTIONS>==#

# impact detection
scoreboard players set #xem.mind.meditation.mind.impact xem.op 1
execute on vehicle on vehicle run scoreboard players set #xem.mind.meditation.mind.impact xem.op 0
execute if score #xem.mind.meditation.mind.impact xem.op matches 1 run function energy_manipulation:mind/meditation/mind/kill_mind with entity @s data.energy_manipulation.meditation
execute if score #xem.mind.meditation.mind.impact xem.op matches 1 run return 0

# shift detection
scoreboard players set #xem.mind.meditation.mind.sneak xem.op 0
$execute as $(owner_uuid) if predicate xylo_library:no_vehicle store success score #xem.mind.meditation.mind.sneak xem.op run ride @s mount $(horse_uuid)
$execute as $(owner_uuid) run function energy_manipulation:mind/meditation/mind/action/sneak
execute if score #xem.mind.meditation.mind.sneak xem.op matches 2 run function energy_manipulation:mind/meditation/mind/kill_mind with entity @s data.energy_manipulation.meditation

#==<DISPOSE>==#

# display rotation
$execute on vehicle at @s rotated as $(owner_uuid) run tp @s ~ ~ ~ ~ ~
# get dash strength
scoreboard players set #xem.mind.meditation.mind xem.op 0
$scoreboard players operation #xem.mind.meditation.mind xem.op >< $(owner_uuid) test_jump
# reset dash detection
$execute if score #xem.mind.meditation.mind xem.op matches 1.. at $(shulker_uuid) run tp $(horse_uuid) ~ ~1.0 ~

# return if no dash
execute unless score #xem.mind.meditation.mind xem.op matches 1.. run return 1
# dash motion
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.initial_speed double 0.2 run scoreboard players get #xem.mind.meditation.mind xem.op
execute on vehicle rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data
execute on vehicle on vehicle run data modify entity @s Motion set from storage energy_manipulation:op temp_motion
