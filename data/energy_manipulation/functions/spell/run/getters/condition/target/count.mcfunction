# get max min
execute store result score #xem.spell.run.getters.condition.target.max_count xem.op run data get storage energy_manipulation:op condition_in.target_count.max_count
execute store result score #xem.spell.run.getters.condition.target.min_count xem.op run data get storage energy_manipulation:op condition_in.target_count.min_count

execute store result score #xem.spell.run.getters.condition.target.count xem.op run data get storage energy_manipulation:op target_out
execute unless score #xem.spell.run.getters.condition.target.count xem.op >= #xem.spell.run.getters.condition.target.min_count xem.op run scoreboard players set #xem.spell.run.getters.condition.target.count_passed xem.op 0
execute if data storage energy_manipulation:op condition_in.target_count.max_count unless score #xem.spell.run.getters.condition.target.count xem.op <= #xem.spell.run.getters.condition.target.max_count xem.op run scoreboard players set #xem.spell.run.getters.condition.target.count_passed xem.op 0
