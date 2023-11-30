# -> {path}

# target Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"target",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.target[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# anchor Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"anchor",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.anchor[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# offset Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"offset",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.offset[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
