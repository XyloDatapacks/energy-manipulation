#-> {owner_uuid, horse_uuid, shulker_uuid}

# exit detection
scoreboard players set #xem.mind.meditation.mind.impact xem.op 1
execute on vehicle on vehicle run scoreboard players set #xem.mind.meditation.mind.impact xem.op 0
execute if score #xem.mind.meditation.mind.impact xem.op matches 1 run function energy_manipulation:mind/meditation/mind/kill_mind with entity @s data.energy_manipulation.meditation
execute if score #xem.mind.meditation.mind.impact xem.op matches 1 run return 0

# display rotation
$execute on vehicle at @s rotated as $(owner_uuid) run tp @s ~ ~ ~ ~ ~
# get dash strength
scoreboard players set #xem.mind.meditation.mind xem.op 0
$scoreboard players operation #xem.mind.meditation.mind xem.op >< $(owner_uuid) test_jump
# reset dash detection
#$execute if score #xem.mind.meditation.mind xem.op matches 0 as $(owner_uuid) on vehicle run ride @s dismount
#$execute if score #xem.mind.meditation.mind xem.op matches 1.. as $(owner_uuid) on vehicle run ride @s mount $(shulker_uuid)

# return if no dash
execute unless score #xem.mind.meditation.mind xem.op matches 1.. run return 1
# dash motion
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.initial_speed double 0.2 run scoreboard players get #xem.mind.meditation.mind xem.op
execute on vehicle rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data
execute on vehicle on vehicle run data modify entity @s Motion set from storage energy_manipulation:op temp_motion
