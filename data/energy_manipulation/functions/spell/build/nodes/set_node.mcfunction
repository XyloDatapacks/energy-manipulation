# -> {key, value, path, final}
# set value of a node using path and key to identify it
# the value is set in energy_manipulation:op spell_build_edit to be able to put the result in a chosen position
# the build storage gets cleaned from childs of the node

#==<Add Node>==#
# get info from previous version of the Node
$function energy_manipulation:spell/build/nodes/$(key)/_pre_node_set/init {path:"$(path)"}
data remove storage energy_manipulation:op old_node_data.parent
$data modify storage energy_manipulation:op old_node_data.parent set from storage energy_manipulation:op spell_build[{path:"$(path)",key:"$(key)"}].parent
# remove same Node if present
$data remove storage energy_manipulation:op spell_build[{path:"$(path)",key:"$(key)"}]
# add new one
$data modify storage energy_manipulation:op spell_build_edit append value {key:"$(key)",value:$(value),path:"$(path)",final:$(final)b}
# set node data
data modify storage energy_manipulation:op spell_build_edit[-1].parent set from storage energy_manipulation:op old_node_data.parent
execute store result score #xem.spell.build.nodes.set_node.nest xem.op store result storage energy_manipulation:op spell_build_edit[-1].nest int 1 run data get storage energy_manipulation:op set_node_nest.nest
$function energy_manipulation:spell/build/nodes/$(key)/_post_node_set/modify_node
# set value_index (optional when setting base value)
execute if score #xem.spell.build.nodes.set_node.set_value_index xem.op matches 1.. store result storage energy_manipulation:op spell_build_edit[-1].value_index int 1 run scoreboard players get #xem.spell.build.nodes.set_node.set_value_index xem.op
scoreboard players reset #xem.spell.build.nodes.set_node.set_value_index xem.op

#==<Set Extra Node Data & Add Sub-Nodes>==#
# remove previous sub-Nodes if present
$data remove storage energy_manipulation:op spell_build[{parent:{path:"$(path)",key:"$(key)"}}]
# increase nest
execute store result storage energy_manipulation:op set_node_nest.nest int 1 run scoreboard players add #xem.spell.build.nodes.set_node.nest xem.op 1

# set extra node data & add sub-nodes 
# WARNING: This function call, will end up calling set_node again. so after this line, i cant use previous temp var
$function energy_manipulation:spell/build/nodes/$(key)/set {key:"$(key)",value:"$(value)",path:"$(path).$(key)"}
# instuction sub-node (for instruction, except value:"none")
$function energy_manipulation:spell/build/nodes/$(key)/_builder/build with storage energy_manipulation:op spell_build_edit[{path:"$(path)",key:"$(key)"}].parent

# save parent for clean up
$data modify storage energy_manipulation:op spell_build_edit[{path:"$(path).$(key)"}].parent set value {path:"$(path)",key:"$(key)"}
# save parent first instruction in program
$function energy_manipulation:spell/build/nodes/$(key)/_post_parent_set/set_parent {path:"$(path)"}

# decrease nest
execute store result storage energy_manipulation:op set_node_nest.nest int 1 run scoreboard players remove #xem.spell.build.nodes.set_node.nest xem.op 1