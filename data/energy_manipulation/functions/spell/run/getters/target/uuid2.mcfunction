#extra check for concealed targets
execute if score @s xem.mind.is_concealed matches 1 run function energy_manipulation:spell/run/getters/target/_is_in_sight
execute if score #xem.spell.run.getters.target._is_in_sight xem.op matches 0 run return 0

function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

# confirm entity found
scoreboard players set xem.spell.run.getters.target.found xem.op 1
