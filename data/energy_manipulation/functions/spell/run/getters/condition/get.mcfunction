# in: "energy_manipulation:op condition_in", "energy_manipulation:op initial_condition", "energy_manipulation:op initial_rotation"
# out: "energy_manipulation:op condition_out"
# out: "xem.spell.run.getters.condition.passed xem.op" condition passed sb

# success sb
scoreboard players set xem.spell.run.getters.condition.passed xem.op 0

# reset output
data remove storage energy_manipulation:op condition_out

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op condition_in.value
function energy_manipulation:spell/run/getters/condition/sort with storage energy_manipulation:op macro_data

# inverted
execute if data storage energy_manipulation:op condition_in{inverted:"true_boolean"} run scoreboard players remove xem.spell.run.getters.condition.passed xem.op 1
execute if score xem.spell.run.getters.condition.passed xem.op matches -1 run scoreboard players set xem.spell.run.getters.condition.passed xem.op 1

# return value
return run scoreboard players get xem.spell.run.getters.condition.passed xem.op