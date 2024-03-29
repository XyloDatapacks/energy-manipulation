# -> {path}

# size Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"size",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.size[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# duration Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"duration",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.duration[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# fire_rate Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"fire_rate",path:"$(path)"}
scoreboard players set #xem.spell.build.nodes.set_node.set_value_index xem.op 2
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.fire_rate[2] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# target_aoe Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"target_aoe",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.target_aoe[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data

# effect Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"effect",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.effect[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data