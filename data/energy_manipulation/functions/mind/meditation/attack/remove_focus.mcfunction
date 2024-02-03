# init focus
execute unless score @s xem.mind.focus = @s xem.mind.focus run scoreboard players set @s xem.mind.focus 2000
# get strength from motion absolute value (since this function is called right after the position correction, the storage distance_out still has the motion value)
execute store result score #xem.mind.meditation.attack.attack_strength xem.op run data get storage xylo_library:op distance_out 100
# remove focus
scoreboard players operation @s xem.mind.focus -= #xem.mind.meditation.attack.attack_strength xem.op
execute if score @s xem.mind.focus matches ..0 run scoreboard players set #xem.mind.meditation.attack.focus_broken xem.op 1
scoreboard players operation @s xem.mind.focus > #0 xconst

