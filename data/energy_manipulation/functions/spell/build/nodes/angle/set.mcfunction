# -> {key, value, path}

# common sub-nodes

# angle_format Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"angle_format",path:"$(path)"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.angle_format[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data


# call right init
$function energy_manipulation:spell/build/nodes/angle/type/$(value) {path:"$(path)"}
