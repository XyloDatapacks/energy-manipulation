# -> {value}: instruction key

# elaborate instruction
$data modify storage energy_manipulation:op instruction set from storage energy_manipulation:op selected_program[0].instruction.$(value)
$function energy_manipulation:spell/run/elaborate/instruction/$(value)/start

# cycle
scoreboard players remove xem.spell.run.elaborate.instructions_count xem.op 1
execute unless score xem.spell.run.elaborate.instructions_count xem.op matches 1.. run return 0
data remove storage energy_manipulation:op selected_program[0]

# loop
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_program[0].instruction.value
function energy_manipulation:spell/run/elaborate/instruction with storage energy_manipulation:op macro_data
