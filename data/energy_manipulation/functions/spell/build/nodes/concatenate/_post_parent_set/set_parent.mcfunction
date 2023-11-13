# -> {path} : concatenate's path

$execute store result score #xem.spell.build.nodes.concatenate.builder.build.index xem.op run data get storage energy_manipulation:op spell_build_edit[{path:"$(path)",key:"concatenate"}].concatenate_index
$execute unless data storage energy_manipulation:op spell_build_edit[{path:"$(path)",key:"concatenate",value:"none"}] store result storage energy_manipulation:op spell_build_edit[{path:"$(path).concatenate",key:"concatenate"}].concatenate_index int 1 run scoreboard players add #xem.spell.build.nodes.concatenate.builder.build.index xem.op 1

