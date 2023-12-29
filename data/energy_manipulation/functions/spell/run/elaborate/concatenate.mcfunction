# "energy_manipulation:op running_spell_marker" read only (initial data for this tick)
# "energy_manipulation:op selected_concatenate" read only (initial data for this tick)

# "#xem.spell.run.elaborate.concatenate_index xem.op" read only (initial data for this tick)
# "#xem.spell.run.elaborate.concatenate_index_max xem.op" read only (initial data for this tick)

# "energy_manipulation:op running_spell_data" can update 
# "energy_manipulation:op initial_position" can update 
# "energy_manipulation:op initial_rotation" can update 

# pay cost
data modify storage energy_manipulation:op energy_cost set from storage energy_manipulation:op selected_concatenate.concatenate.cost
data modify storage energy_manipulation:op energy_cost.caster set from storage energy_manipulation:op running_spell_marker.data.energy_manipulation.spell_data.caster
function energy_manipulation:spell/cost/pay with storage energy_manipulation:op energy_cost
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run kill @s
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 at @s run function energy_manipulation:spell/cost/fx_spell_cost_not_paid
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 1

# get data
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op running_spell_marker.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op running_spell_marker.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op running_spell_marker.data.energy_manipulation.spell_data
# copy running spell marker to have an editable data
data modify storage energy_manipulation:op running_spell_marker_update set from storage energy_manipulation:op running_spell_marker

# split counter
execute if score #xem.spell.run.elaborate.is_split xem.op matches 1 store result storage energy_manipulation:op running_spell_marker.data.energy_manipulation.spell_data.split_number int 1 run scoreboard players add #xem.spell.run.elaborate.split.split_number xem.op 1 
# rotate split
execute if score #xem.spell.run.elaborate.is_split xem.op matches 1 run function energy_manipulation:spell/run/elaborate/rotate_split

#===================#

# program
execute store result score xem.spell.run.elaborate.instructions_count xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.program
execute if score xem.spell.run.elaborate.instructions_count xem.op matches 1.. run function energy_manipulation:spell/run/elaborate/program

# run shape
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
execute unless score xem.spell.run.elaborate.instructions_count xem.op matches ..-1 run function energy_manipulation:spell/run/elaborate/run_shape
# kill if failed to pay for extra shape costs
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run kill @s
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 at @s run function energy_manipulation:spell/cost/fx_spell_cost_not_paid
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 1

#===================#

# kill and return if done and not in shape form
execute if score #xem.spell.run.elaborate.concatenate_index xem.op >= #xem.spell.run.elaborate.concatenate_index_max xem.op unless data storage energy_manipulation:op running_spell_marker_update{Tags:[xem.spell.inactive]} run kill @s
execute if score #xem.spell.run.elaborate.concatenate_index xem.op >= #xem.spell.run.elaborate.concatenate_index_max xem.op unless data storage energy_manipulation:op running_spell_marker_update{Tags:[xem.spell.inactive]} run return 1

# update data
data modify storage energy_manipulation:op running_spell_marker_update.Pos set from storage energy_manipulation:op initial_position
data modify storage energy_manipulation:op running_spell_marker_update.Rotation set from storage energy_manipulation:op initial_rotation
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.spell_data set from storage energy_manipulation:op running_spell_data

# restore data (for split)
scoreboard players operation @s xem.spell.run.elaborate.concatenate_index = #xem.spell.run.elaborate.concatenate_index xem.op
scoreboard players operation @s xem.spell.run.elaborate.concatenate_index_max = #xem.spell.run.elaborate.concatenate_index_max xem.op
execute unless score @s xem.spell.caster_last_death_time = @s xem.spell.caster_last_death_time run scoreboard players operation @s xem.spell.caster_last_death_time = #xem.spell.run.elaborate.caster_last_death_time xem.op
data modify entity @s {} merge from storage energy_manipulation:op running_spell_marker_update

# make sure it has tag
tag @s add smithed.entity
tag @s add smithed.strict

