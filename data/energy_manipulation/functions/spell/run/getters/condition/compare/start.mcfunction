#get value 1
data modify storage energy_manipulation:op get_value_in set from storage energy_manipulation:op condition_in.get_value1
function energy_manipulation:spell/run/getters/get_value/get
execute store result score #xem.spell.run.getters.condition.compare.value1 xem.op run data get storage energy_manipulation:op get_value_out 100

#get vaue 2
data modify storage energy_manipulation:op get_value_in set from storage energy_manipulation:op condition_in.get_value2
function energy_manipulation:spell/run/getters/get_value/get
execute store result score #xem.spell.run.getters.condition.compare.value2 xem.op run data get storage energy_manipulation:op get_value_out 100

execute if data storage energy_manipulation:op condition_in{compare_type:"equal"} unless score #xem.spell.run.getters.condition.compare.value1 xem.op = #xem.spell.run.getters.condition.compare.value2 xem.op run return 0
execute if data storage energy_manipulation:op condition_in{compare_type:"greater_than_or_equal_to"} unless score #xem.spell.run.getters.condition.compare.value1 xem.op >= #xem.spell.run.getters.condition.compare.value2 xem.op run return 0
execute if data storage energy_manipulation:op condition_in{compare_type:"greater_than"} unless score #xem.spell.run.getters.condition.compare.value1 xem.op > #xem.spell.run.getters.condition.compare.value2 xem.op run return 0
execute if data storage energy_manipulation:op condition_in{compare_type:"less_than_or_equal_to"} unless score #xem.spell.run.getters.condition.compare.value1 xem.op <= #xem.spell.run.getters.condition.compare.value2 xem.op run return 0
execute if data storage energy_manipulation:op condition_in{compare_type:"less_than"} unless score #xem.spell.run.getters.condition.compare.value1 xem.op < #xem.spell.run.getters.condition.compare.value2 xem.op run return 0

data modify storage energy_manipulation:op condition_out set value {value:"true"}
scoreboard players set xem.spell.run.getters.condition.passed xem.op 1
