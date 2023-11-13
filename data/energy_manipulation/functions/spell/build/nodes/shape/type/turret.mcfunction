# -> {path}

# movement Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"movement",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.movement[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# duration Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"duration",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.duration[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# condition Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"condition",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.condition[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# fire_mode Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"fire_mode",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.fire_mode[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

