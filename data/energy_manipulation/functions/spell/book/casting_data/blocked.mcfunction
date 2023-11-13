data modify storage energy_manipulation:op energy_cost set value {type:"generic"}
execute store result storage energy_manipulation:op energy_cost.cost int 0.1 run scoreboard players get @s xem.spell.book.dmg_blocked
function energy_manipulation:spell/cost/execute

scoreboard players reset @s xem.spell.book.dmg_blocked
