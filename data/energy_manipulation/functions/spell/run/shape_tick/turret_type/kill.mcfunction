#<@> spell marker
# display -> spell marker

execute on vehicle run kill @s

# remove tags
tag @s remove xem.spell.inactive
tag @s remove xem.spell.shape_marker
tag @s remove xem.spell.turret_type
tag @s remove xem.spell.turret_type.terminate.condition

# check for terminate instruction (if none, kill and return)
data modify storage energy_manipulation:op turret_type_instruction_data set from entity @s {}
execute store success score #xem.spell.run.shape_tick.turret_type.kill.has_instruction xem.op if data storage energy_manipulation:op turret_type_instruction_data.data.energy_manipulation.shape.terminate.instruction
execute if score #xem.spell.run.shape_tick.turret_type.kill.has_instruction xem.op matches 0 run return run kill @s

#get rest of the data needed for concatenate context
scoreboard players operation #xem.spell.run.elaborate.concatenate_index xem.op = @s xem.spell.run.elaborate.concatenate_index 
scoreboard players operation #xem.spell.run.elaborate.concatenate_index_max xem.op = @s xem.spell.run.elaborate.concatenate_index_max
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op turret_type_instruction_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op turret_type_instruction_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op turret_type_instruction_data.data.energy_manipulation.spell_data
data modify storage energy_manipulation:op running_spell_marker_update set from storage energy_manipulation:op turret_type_instruction_data

# execute instruction (like in "energy_manipulation:spell/run/elaborate/program")
scoreboard players set xem.spell.run.elaborate.instructions_count xem.op 1
data modify storage energy_manipulation:op selected_program set value [{}]
data modify storage energy_manipulation:op selected_program[0].instruction set from storage energy_manipulation:op turret_type_instruction_data.data.energy_manipulation.shape.terminate.instruction
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_program[0].instruction.value
function energy_manipulation:spell/run/elaborate/instruction with storage energy_manipulation:op macro_data

#(from "energy_manipulation:spell/run/elaborate/concatenate")
# update data
data modify storage energy_manipulation:op running_spell_marker_update.Pos set from storage energy_manipulation:op initial_position
data modify storage energy_manipulation:op running_spell_marker_update.Rotation set from storage energy_manipulation:op initial_rotation
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.spell_data set from storage energy_manipulation:op running_spell_data

# restore data (for split)
scoreboard players operation @s xem.spell.run.elaborate.concatenate_index = #xem.spell.run.elaborate.concatenate_index xem.op
scoreboard players operation @s xem.spell.run.elaborate.concatenate_index_max = #xem.spell.run.elaborate.concatenate_index_max xem.op
execute unless score @s xem.spell.caster_last_death_time = @s xem.spell.caster_last_death_time run scoreboard players operation @s xem.spell.caster_last_death_time = #xem.spell.run.elaborate.caster_last_death_time xem.op
data modify entity @s {} merge from storage energy_manipulation:op running_spell_marker_update

