tellraw @s {"text":"\n=================================\n"}

tellraw @s[tag=!xem.settings.hide_gui] [{"translate": "settings.energy_manipulation.gui.show_gui"},": ",{"translate": "settings.energy_manipulation.gui.show_gui.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.gui -1"}}] 
tellraw @s[tag=xem.settings.hide_gui] [{"translate": "settings.energy_manipulation.gui.show_gui"},": ",{"translate": "settings.energy_manipulation.gui.show_gui.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.gui -2"}}] 

tellraw @s {"text":"\n=================================\n"}

scoreboard players set @s xem.settings.gui 0

