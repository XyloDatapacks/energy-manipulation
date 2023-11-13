# -> {path}

# inverted Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"inverted",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.inverted[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# target Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"target",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.target[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# target_count Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"target_count",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.target_count[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

