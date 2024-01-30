execute if score @s xem.settings.spell_settings matches -1 run tag @s remove xem.settings.spell_settings.use_raw_energy_first
execute if score @s xem.settings.spell_settings matches -2 run tag @s add xem.settings.spell_settings.use_raw_energy_first

function energy_manipulation:trigger/spell_settings/show_menu