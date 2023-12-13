# -> {path}

# inverted Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"inverted",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.inverted[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# compare_type Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"compare_type",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 2
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.compare_type[2] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# get_value1 Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"get_value1",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.get_value1[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# get_value2 Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"get_value2",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.get_value2[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

