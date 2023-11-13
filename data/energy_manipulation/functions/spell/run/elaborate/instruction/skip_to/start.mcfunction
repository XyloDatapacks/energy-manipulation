# in: "energy_manipulation:op instruction"

# test condition
data modify storage energy_manipulation:op condition_in set from storage energy_manipulation:op selected_program[0].instruction.condition
function energy_manipulation:spell/run/getters/condition/get
execute unless score xem.spell.run.getters.condition.passed xem.op matches 1 run return 0

execute store result score #xem.spell.run.elaborate.concatenate_index xem.op run data get storage energy_manipulation:op selected_program[0].instruction.concatenate_index
scoreboard players set xem.spell.run.elaborate.instructions_count xem.op -1
