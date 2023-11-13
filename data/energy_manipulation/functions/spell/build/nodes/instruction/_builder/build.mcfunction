# -> {path} : program node path

# check if last instruction has none value (aka im not editing last instruction)
data remove storage energy_manipulation:op macro_data
$data modify storage energy_manipulation:op macro_data.program_path set value "$(path)"
$execute store result storage energy_manipulation:op macro_data.array_index int 1 store result score #xem.spell.build.nodes.instruction.builder.build.index xem.op run data get storage energy_manipulation:op spell_build[{path:"$(path)",key:"program"}].array_index
function energy_manipulation:spell/build/nodes/instruction/_builder/check with storage energy_manipulation:op macro_data
execute if score #xem.success xem.op matches 0 run return 0
# if im editing last instruction add another node
$execute store result storage energy_manipulation:op macro_data.array_index int 1 store result storage energy_manipulation:op spell_build[{path:"$(path)",key:"program"}].array_index int 1 run scoreboard players add #xem.spell.build.nodes.instruction.builder.build.index xem.op 1
function energy_manipulation:spell/build/nodes/instruction/_builder/build2 with storage energy_manipulation:op macro_data

