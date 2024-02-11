# advancement reward function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

# message
execute unless score @s xem.player_version = @s xem.player_version run tellraw @s {"text":"Wellcome to Energy Manipulation. By Xylo_Datapacks","color":"dark_aqua"}
# update version
scoreboard players operation @s xem.player_version = #xem.pack_version xem.op

# init last death time if not specified
execute unless score @s xem.last_death_time = @s xem.last_death_time run scoreboard players operation @s xem.last_death_time = #xlib.time xlib.op

# init attributes
execute unless score @s xem.spell.raw_energy.max = @s xem.spell.raw_energy.max run scoreboard players operation @s xem.spell.raw_energy.max = #xem.spell.raw_energy.max xem.op
execute unless score @s xem.spell.casting_fatigue.max = @s xem.spell.casting_fatigue.max run scoreboard players operation @s xem.spell.casting_fatigue.max = #xem.spell.casting_fatigue.max xem.op
execute unless score @s xem.mind.focus.max = @s xem.mind.focus.max run scoreboard players operation @s xem.mind.focus.max = #xem.mind.focus.max xem.op
