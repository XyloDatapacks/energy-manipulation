# -> {path}

# min_distance Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"min_distance",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.min_distance[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
