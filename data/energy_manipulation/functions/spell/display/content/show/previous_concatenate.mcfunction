execute unless score @s xem.spell.display.showing_value matches 1 run scoreboard players set #xem.spell.display.content.show.concat xem.op -1
execute if score @s xem.spell.display.showing_value matches 1 run scoreboard players remove @s xem.spell.display.node_index_input 5
function energy_manipulation:spell/display/content/set_from_score
