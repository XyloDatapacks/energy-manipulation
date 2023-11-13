# -> {path}

# max_distance Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"max_distance",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.max_distance[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# blocking_hits Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"blocking_hits",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.blocking_hits[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

