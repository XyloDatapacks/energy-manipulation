# -> {uuid, origin_uuid}

# removes focus from origin_uuid
# executes action on uuid


# remove focus and quit if focus not broken
scoreboard players set #xem.mind.meditation.attack.focus_broken xem.op 0
$execute as $(origin_uuid) run function energy_manipulation:mind/meditation/attack/remove_focus
execute if score #xem.mind.meditation.attack.focus_broken xem.op matches 0 run return run function energy_manipulation:mind/meditation/fx/attack/start
function energy_manipulation:mind/meditation/fx/apply_order/start

# get attack mode
scoreboard players set #xem.mind.meditation.attack.attack_mode xem.op 0
execute on passengers if entity @s[type=minecraft:player] run scoreboard players operation #xem.mind.meditation.attack.attack_mode xem.op = @s xem.mind.meditation.action.attack_mode
# get attack power
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.power double 1 run data get storage xylo_library:op distance_out 20
# execute attack
$execute as $(uuid) run function energy_manipulation:mind/meditation/attack/execute_attack_mode with storage energy_manipulation:op macro_data

