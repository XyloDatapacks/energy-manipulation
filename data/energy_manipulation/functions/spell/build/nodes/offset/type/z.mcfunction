# -> {path}

# z Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"z",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 33
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.z[33] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
