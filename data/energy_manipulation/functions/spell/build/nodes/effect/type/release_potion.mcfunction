# -> {path}

# potion_duration Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"potion_duration",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.potion_duration[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# slot Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"slot",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.slot[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data