# generic spell data
data modify storage energy_manipulation:op turret_type_condition_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op turret_type_condition_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op turret_type_condition_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.spell_data

# test condition
data modify storage energy_manipulation:op condition_in set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.shape.terminate.condition
execute unless function energy_manipulation:spell/run/getters/condition/get run return 0

function energy_manipulation:spell/run/shape/turret/tick/kill
return 1
