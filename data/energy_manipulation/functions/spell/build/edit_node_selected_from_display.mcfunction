# set from last displayed node value

execute store result storage energy_manipulation:op get_selected_node_values.index int 1 store result storage energy_manipulation:op input_node_index.index int 1 run scoreboard players get @s xem.spell.display.index_input
function energy_manipulation:spell/display/content/get_node_values/get_values with storage energy_manipulation:op get_selected_node_values

execute store result storage energy_manipulation:op get_selected_node_values.index int 1 run scoreboard players get @s xem.spell.display.node_index_input
function energy_manipulation:spell/display/content/get_node_values/get_selected_value with storage energy_manipulation:op get_selected_node_values

scoreboard players set #xem.spell.build.ensfd xem.op 1
data modify storage energy_manipulation:op input_node_value set from storage energy_manipulation:op node_value
function energy_manipulation:spell/build/edit_node_selected
