# -> {index} 
# in: "energy_manipulation:op input_node_value{value}"

# clean set_node output
data modify storage energy_manipulation:op spell_build_edit set value []

# set data
data remove storage energy_manipulation:op macro_data
# get value from input storage (checking that is different)
$data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op spell_build[$(index)].value
execute store success score #xem.spell.build.edit_node.has_new_value xem.op run data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op input_node_value.value
execute if score #xem.spell.build.edit_node.has_new_value xem.op matches 0 run return 0
data modify storage energy_manipulation:op macro_data.final set from storage energy_manipulation:op input_node_value.final
# get key and path from the node im gonna modify
$data modify storage energy_manipulation:op macro_data.key set from storage energy_manipulation:op spell_build[$(index)].key
$data modify storage energy_manipulation:op macro_data.path set from storage energy_manipulation:op spell_build[$(index)].path
# set nest
$data modify storage energy_manipulation:op set_node_nest.nest set from storage energy_manipulation:op spell_build[$(index)].nest
# modify node using set_node and the info just set
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# set value index (if set from score) [use this index, cause the values array gets filtered by the display, so the display_index is different from the actual position index in the values array]
execute if score #xem.spell.build.ensfd xem.op matches 1 store result storage energy_manipulation:op spell_build_edit[0].value_index int 1 run scoreboard players get @s xem.spell.display.node_index_input
scoreboard players set #xem.spell.build.ensfd xem.op 0

# add set_node result
$data modify storage energy_manipulation:op spell_build insert $(index) from storage energy_manipulation:op spell_build_edit[]

# clean
function energy_manipulation:spell/build/clean/start

# modified storage 
scoreboard players set #xem.spell.build.modified_storage xem.op 1