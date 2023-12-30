# advancement reward function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

# init last death time if not specified
execute unless score @s xem.last_death_time = @s xem.last_death_time run scoreboard players operation @s xem.last_death_time = #xlib.time xlib.op

#set focus
scoreboard players set @s xem.mind.focus 100


tellraw @s {"text":"Wellcome to Energy Manipulation. By Xylo_Datapacks","color":"dark_aqua"}