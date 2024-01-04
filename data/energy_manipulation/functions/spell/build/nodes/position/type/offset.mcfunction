# -> {path}

# offset Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"offset",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 1
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.offset[1] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
