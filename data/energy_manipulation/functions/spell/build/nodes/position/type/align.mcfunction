# -> {path}

# axis Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"axis",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.axis[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
