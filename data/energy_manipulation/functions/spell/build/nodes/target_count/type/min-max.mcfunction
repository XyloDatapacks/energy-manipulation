# -> {path}

# min_count Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"min_count",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.min_count[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# max_count Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"max_count",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.max_count[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
