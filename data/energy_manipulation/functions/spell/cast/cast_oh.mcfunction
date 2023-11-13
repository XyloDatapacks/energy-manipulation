scoreboard players reset @s xem.debug.cost_since_last_spell

function energy_manipulation:spell/cast/load_data/oh
scoreboard players set xem.spell.cast.compiled xem.op 0
execute if data storage energy_manipulation:op {spell:0} run function energy_manipulation:spell/cast/compile
execute if score xem.spell.cast.compiled xem.op matches 1 run item modify entity @s weapon.offhand energy_manipulation:spell/book/save_spell
execute unless data storage energy_manipulation:op spell[0] run return 0
function energy_manipulation:spell/run/new

execute rotated ~ 0 positioned ^0.3 ^ ^0.45 run function energy_manipulation:spell/cast/particles
playsound energy_manipulation:spell.cast player @a ^ ^ ^0.3 3.0 1
