# grab objects
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op condition_in.target
function energy_manipulation:spell/run/getters/target/get
execute if score xem.spell.run.getters.target.found xem.op matches 0 run return 0

# check count
scoreboard players set #xem.spell.run.getters.condition.target.count_passed xem.op 1
execute unless data storage energy_manipulation:op condition_in.target_count{value:"any"} run function energy_manipulation:spell/run/getters/condition/target/count
execute if score #xem.spell.run.getters.condition.target.count_passed xem.op matches 0 run return 0

data modify storage energy_manipulation:op condition_out set value {value:"true"}
data modify storage energy_manipulation:op condition_out.objects set from storage energy_manipulation:op target_out 
scoreboard players set xem.spell.run.getters.condition.passed xem.op 1
