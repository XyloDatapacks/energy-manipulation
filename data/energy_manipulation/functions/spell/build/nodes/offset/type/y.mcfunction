# -> {path}

# offset_format Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"offset_format",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 1
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.offset_format[1] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# y Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"y",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 33
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.y[33] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
