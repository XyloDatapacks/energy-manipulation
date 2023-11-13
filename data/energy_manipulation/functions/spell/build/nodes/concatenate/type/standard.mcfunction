# -> {path}

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
