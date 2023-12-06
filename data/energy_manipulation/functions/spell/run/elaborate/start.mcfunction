# in: <@> spell marker
# out: "energy_manipulation:op running_spell_marker" read only
# out: "energy_manipulation:op selected_concatenate" read only

# kill and return + particles for cost not paid if caster died
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 at @s run function energy_manipulation:spell/cost/fx_spell_cost_not_paid
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run kill @s
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return 1

# kill and return if done 
execute store success score #xem.spell.run.elaborate.excede_max_index xem.op if score @s xem.spell.run.elaborate.concatenate_index >= @s xem.spell.run.elaborate.concatenate_index_max
execute if score #xem.spell.run.elaborate.excede_max_index xem.op matches 1 run kill @s
execute if score #xem.spell.run.elaborate.excede_max_index xem.op matches 1 run return 1

# get data
data modify storage energy_manipulation:op running_spell_marker set from entity @s {}

# get current concatenate (from index)
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.index int 1 store result score #xem.spell.run.elaborate.concatenate_index xem.op run scoreboard players get @s xem.spell.run.elaborate.concatenate_index
function energy_manipulation:spell/run/elaborate/get_concatenate with storage energy_manipulation:op macro_data
# score values (for split)
scoreboard players add #xem.spell.run.elaborate.concatenate_index xem.op 1
scoreboard players operation #xem.spell.run.elaborate.concatenate_index_max xem.op = @s xem.spell.run.elaborate.concatenate_index_max
scoreboard players operation #xem.spell.run.elaborate.caster_last_death_time xem.op = @s xem.spell.caster_last_death_time

# run mode
scoreboard players set #xem.spell.run.elaborate.is_split xem.op 0
execute if data storage energy_manipulation:op selected_concatenate.concatenate{value:"standard"} at @s run function energy_manipulation:spell/run/elaborate/concatenate
execute if data storage energy_manipulation:op selected_concatenate.concatenate{value:"split"} at @s run function energy_manipulation:spell/run/elaborate/split
