# -> {path}

# splits Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"splits",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.splits[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# yawn Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"yawn",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 36
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.yawn[36] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# pitch Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"pitch",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 36
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.pitch[36] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# program Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"program",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.program[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# shape Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"shape",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.shape[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# concatenate Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"concatenate",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.concatenate[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
