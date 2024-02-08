$execute if score #xem.gui.casting_fatigue xem.op matches ..9 run data modify storage energy_manipulation:op gui.casting_fatigue set value '{"text":"\\uE00$(casting_fatigue)"}'
$execute if score #xem.gui.casting_fatigue xem.op matches 10.. run data modify storage energy_manipulation:op gui.casting_fatigue set value '{"text":"\\uE0$(casting_fatigue)"}'
$execute if score #xem.gui.raw_energy xem.op matches ..9 run data modify storage energy_manipulation:op gui.raw_energy set value '{"text":"\\uE00$(raw_energy)"}'
$execute if score #xem.gui.raw_energy xem.op matches 10.. run data modify storage energy_manipulation:op gui.raw_energy set value '{"text":"\\uE0$(raw_energy)"}'
$execute if score #xem.gui.focus xem.op matches ..9 run data modify storage energy_manipulation:op gui.focus set value '{"text":"\\uE00$(focus)"}'
$execute if score #xem.gui.focus xem.op matches 10.. run data modify storage energy_manipulation:op gui.focus set value '{"text":"\\uE0$(focus)"}'

execute if score #xem.gui.has_book xem.op matches 0 run data modify storage energy_manipulation:op internal_gui set value '["",{"translate":"space.289","font":"space:default"},{"translate":"offset.0","font":"space:default","with":[{"storage":"energy_manipulation:op","nbt":"gui.focus","interpret":true,"font":"energy_manipulation:gui/mind/focus/bar","color":"#4404f9"}]}]'
execute if score #xem.gui.has_book xem.op matches 0 run scoreboard players set @s xlib.internal.gui.priority 0
execute if score #xem.gui.has_book xem.op matches 1 run data modify storage energy_manipulation:op internal_gui set value '["",{"translate":"space.289","font":"space:default"},{"translate":"offset.82","font":"space:default","with":[{"storage":"energy_manipulation:op","nbt":"gui.casting_fatigue","interpret":true,"font":"energy_manipulation:gui/spell/casting_fatigue/bar","color":"#4404f9"}]},{"translate":"offset.0","font":"space:default","with":[{"storage":"energy_manipulation:op","nbt":"gui.raw_energy","interpret":true,"font":"energy_manipulation:gui/spell/raw_energy/bar","color":"#4404f9"}]},{"translate":"offset.-82","font":"space:default","with":[{"storage":"energy_manipulation:op","nbt":"gui.focus","interpret":true,"font":"energy_manipulation:gui/mind/focus/bar","color":"#4404f9"}]}]'
execute if score #xem.gui.has_book xem.op matches 1 run scoreboard players set @s xlib.internal.gui.priority 1

