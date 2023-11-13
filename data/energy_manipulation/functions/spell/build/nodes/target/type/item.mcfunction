# -> {path}

# distance Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"distance",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.distance[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# sort Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"sort",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.sort[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# selection Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"selection",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.selection[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data