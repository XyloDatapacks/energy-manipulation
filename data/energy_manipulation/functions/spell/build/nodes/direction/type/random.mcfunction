# -> {path}

# yawn_positive Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"yawn_positive",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.yawn_positive[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# pitch_positive Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"pitch_positive",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.pitch_positive[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
