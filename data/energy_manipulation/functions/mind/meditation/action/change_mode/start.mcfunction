# advancement reward function
advancement revoke @s only energy_manipulation:mind/meditation/action/left_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


scoreboard players add @s xem.mind.meditation.action.change_mode 1
scoreboard players set @s[scores={xem.mind.meditation.action.change_mode=4..}] xem.mind.meditation.action.change_mode 0