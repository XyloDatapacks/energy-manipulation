# -> {prev_array_index, array_index, program_path}

# decrease nest
execute store result storage energy_manipulation:op set_node_nest.nest int 1 run scoreboard players remove #xem.spell.build.nodes.set_node.nest xem.op 1

# instruction Sub-Node
$data modify storage energy_manipulation:op macro_data set value {key:"instruction",path:"$(program_path).program[{index:$(array_index)}]"}
data modify storage energy_manipulation:op macro_data merge from storage energy_manipulation:spell nodes_values.instruction[0] 
function energy_manipulation:spell/build/nodes/set_node with storage energy_manipulation:op macro_data
# parent node
$data modify storage energy_manipulation:op spell_build_edit[{path:"$(program_path).program[{index:$(array_index)}]"}].parent set value {path:"$(program_path)",key:"program"}
$data modify storage energy_manipulation:op spell_build_edit[{path:"$(program_path).program[{index:$(array_index)}]"}].instruction_index set value $(array_index)
return 1
