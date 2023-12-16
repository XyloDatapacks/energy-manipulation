# -> {path}

# fire_rate Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"fire_rate",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 2
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.fire_rate[2] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
