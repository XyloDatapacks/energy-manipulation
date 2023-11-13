# -> {array_index, program_path}

# if last instruction has value none, i dont want to add another instruction
scoreboard players set #xem.success xem.op 1
$execute if data storage energy_manipulation:op spell_build[{path:"$(program_path).program[{index:$(array_index)}]",key:"instruction",value:"none"}] run scoreboard players set #xem.success xem.op 0
$execute if data storage energy_manipulation:op spell_build_edit[{path:"$(program_path).program[{index:$(array_index)}]",key:"instruction",value:"none"}] run scoreboard players set #xem.success xem.op 0

