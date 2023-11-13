# -> {path} : program's path

# set parent
$data modify storage energy_manipulation:op spell_build_edit[{path:"$(path).program[{index:0}]"}].parent set value {path:"$(path)",key:"program"}
$data modify storage energy_manipulation:op spell_build_edit[{path:"$(path).program[{index:0}]"}].instruction_index set value 0
