# -> {path}

# hotbar_index Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"hotbar_index",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.hotbar_index[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data