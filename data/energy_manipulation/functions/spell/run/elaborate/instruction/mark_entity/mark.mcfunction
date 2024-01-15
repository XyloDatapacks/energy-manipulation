# -> {caster, index}

data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op selected_program[0].instruction.target
data modify storage energy_manipulation:op target_in.selection set value "single"
function energy_manipulation:spell/run/getters/target/get

$data remove storage energy_manipulation:data players[{uuid:"$(caster)"}].marked_entities[{index:$(index)}]
$execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:data players[{uuid:"$(caster)"}].marked_entities[{index:$(index)}] merge from storage energy_manipulation:op target_out[-1]
