execute unless score @s xem.spell.display.showing_value matches 1 run scoreboard players set @s xem.spell.display.index_input 1000000
execute if score @s xem.spell.display.showing_value matches 1 run scoreboard players set @s xem.spell.display.node_index_input 1000000
function energy_manipulation:spell/display/content/set_from_score
