# -> {path}

# movement Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"movement",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.movement[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# effect Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"effect",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.effect[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data