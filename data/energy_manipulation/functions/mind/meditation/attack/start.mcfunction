#> energy_manipulation:mind/meditation/attack/start
# @context: item_display
# @within: energy_manipulation:mind/meditation/from_mind_check/bounce
# @macro: uuid, origin_uuid
#
# removes focus from origin_uuid
# executes action on uuid

#==<Get Power>==#
# power (power multiplier is already multiplied by 100)
execute store result score #xem.mind.meditation.attack.power xem.op run data get storage xylo_library:op distance_out 10
scoreboard players operation #xem.mind.meditation.attack.power xem.op *= @s xem.mind.meditation.power_multiplier 

tellraw @a[tag=xem.debug.mind.meditation.attack] ["attack power: ",{"score":{"objective":"xem.op","name":"#xem.mind.meditation.attack.power"}}]

#==<Remove Focus>==#

# remove focus and quit if focus not broken
scoreboard players set #xem.mind.meditation.attack.focus_broken xem.op 0
$execute as $(origin_uuid) run function energy_manipulation:mind/meditation/attack/remove_focus
execute if score #xem.mind.meditation.attack.focus_broken xem.op matches 0 run return run function energy_manipulation:mind/meditation/fx/attack/start

#==<Apply Order>==#

# particles
function energy_manipulation:mind/meditation/fx/apply_order/start
# get attack mode
scoreboard players set #xem.mind.meditation.attack.attack_mode xem.op 0
execute on passengers if entity @s[type=minecraft:player] run scoreboard players operation #xem.mind.meditation.attack.attack_mode xem.op = @s xem.mind.meditation.action.attack_mode
# get attack power
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.power double 0.01 run scoreboard players get #xem.mind.meditation.attack.power xem.op
# execute attack
$execute as $(uuid) run function energy_manipulation:mind/meditation/attack/execute_attack_mode with storage energy_manipulation:op macro_data

