# -> {path}

# entity_index Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"entity_index",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.entity_index[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# feature Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"feature",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.feature[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# distance Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"distance",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.distance[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data