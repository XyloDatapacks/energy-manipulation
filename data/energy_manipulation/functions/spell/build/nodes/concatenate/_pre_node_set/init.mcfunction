data modify storage energy_manipulation:op set_node_nest.nest set value 0
$execute store result storage energy_manipulation:op set_node_concatenate_index.index int 1 run data get storage energy_manipulation:op spell_build[{path:"$(path)",key:"concatenate"}].concatenate_index
