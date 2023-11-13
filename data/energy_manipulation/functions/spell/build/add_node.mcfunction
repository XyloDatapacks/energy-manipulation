# -> {key, path} 
# -> storage energy_manipulation:op input_node_value{value, final}

# clean set_node output
data modify storage energy_manipulation:op spell_build_edit set value []

# set data
$data modify storage energy_manipulation:op macro_data set value {key:"$(key)",path:"$(path)"}


data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op input_node_value.value

data modify storage energy_manipulation:op macro_data.final set from storage energy_manipulation:op input_node_value.final



# set nest
data modify storage energy_manipulation:op set_node_nest.nest set value 0
# add node using set_node and the info just set
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data





# add set_node result
data modify storage energy_manipulation:op spell_build append from storage energy_manipulation:op spell_build_edit[]

# clean
function energy_manipulation:spell/build/clean/start

# modified storage
scoreboard players set #xem.spell.build.modified_storage xem.op 1
