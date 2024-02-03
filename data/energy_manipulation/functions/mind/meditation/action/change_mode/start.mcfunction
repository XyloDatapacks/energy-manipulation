# advancement reward function
advancement revoke @s only energy_manipulation:mind/meditation/action/left_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

execute at @s run function energy_manipulation:mind/meditation/fx/change_mode/start

scoreboard players add @s xem.mind.meditation.action.attack_mode 1
# TODO: add more modes
scoreboard players set @s[scores={xem.mind.meditation.action.attack_mode=1..}] xem.mind.meditation.action.attack_mode 0

execute if score @s xem.mind.meditation.action.attack_mode matches 0 run data modify storage smithed.actionbar:input message set value {json:'["",{"translate": "energy_manipulation.mind.meditation.action.change_mode.0"}]', priority:'notification', freeze:20}
execute if score @s xem.mind.meditation.action.attack_mode matches 1 run data modify storage smithed.actionbar:input message set value {json:'["",{"translate": "energy_manipulation.mind.meditation.action.change_mode.1"}]', priority:'notification', freeze:20}
execute if score @s xem.mind.meditation.action.attack_mode matches 2 run data modify storage smithed.actionbar:input message set value {json:'["",{"translate": "energy_manipulation.mind.meditation.action.change_mode.2"}]', priority:'notification', freeze:20}
execute if score @s xem.mind.meditation.action.attack_mode matches 3 run data modify storage smithed.actionbar:input message set value {json:'["",{"translate": "energy_manipulation.mind.meditation.action.change_mode.3"}]', priority:'notification', freeze:20}
function #smithed.actionbar:message