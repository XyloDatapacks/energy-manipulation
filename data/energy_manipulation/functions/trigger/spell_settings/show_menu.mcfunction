tellraw @s {"text":"\n=================================\n"}

tellraw @s[tag=xem.settings.spell_settings.use_raw_energy_first] [{"translate": "settings.energy_manipulation.spell_settings.use_raw_energy_first"},": ",{"translate": "settings.energy_manipulation.spell_settings.use_raw_energy_first.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.spell_settings -1"}}] 
tellraw @s[tag=!xem.settings.spell_settings.use_raw_energy_first] [{"translate": "settings.energy_manipulation.spell_settings.use_raw_energy_first"},": ",{"translate": "settings.energy_manipulation.spell_settings.use_raw_energy_first.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.spell_settings -2"}}] 

tellraw @s {"text":"\n=================================\n"}

scoreboard players set @s xem.settings.spell_settings 0

