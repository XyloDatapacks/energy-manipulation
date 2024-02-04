# grab objects
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op condition_in.target
execute unless function energy_manipulation:spell/run/getters/target/get run return 0

# check count
execute unless data storage energy_manipulation:op condition_in.target_count{value:"any"} unless function energy_manipulation:spell/run/getters/condition/target/count run return 0

data modify storage energy_manipulation:op condition_out set value {value:"true"}
data modify storage energy_manipulation:op condition_out.objects set from storage energy_manipulation:op target_out 
scoreboard players set xem.spell.run.getters.condition.passed xem.op 1
