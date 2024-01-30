# advancement reward function
advancement revoke @s only energy_manipulation:mind/meditation/action/right_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


scoreboard players add @s xem.mind.meditation.action.propel 1
scoreboard players operation @s xem.mind.meditation.action.propel_time = #xlib.time xlib.op
scoreboard players add @s xem.mind.meditation.action.propel_time 5

