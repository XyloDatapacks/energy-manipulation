execute if score @s xem.settings.gui matches -1 run tag @s remove xem.settings.show_gui
execute if score @s xem.settings.gui matches -2 run tag @s add xem.settings.show_gui

function energy_manipulation:trigger/gui/show_menu