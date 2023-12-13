# -> {key, value, path}

# call right init
$function energy_manipulation:spell/build/nodes/counter/type/$(value) {path:"$(path)"}

# get_value Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"get_value",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.get_value[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
