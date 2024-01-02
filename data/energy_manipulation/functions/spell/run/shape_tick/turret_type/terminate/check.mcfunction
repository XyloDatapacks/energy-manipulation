# generic spell data
data modify storage energy_manipulation:op turret_type_condition_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op turret_type_condition_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op turret_type_condition_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.spell_data

# test condition
data modify storage energy_manipulation:op condition_in set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.shape.terminate.condition
function energy_manipulation:spell/run/getters/condition/get
execute unless score xem.spell.run.getters.condition.passed xem.op matches 1 run return 0

function energy_manipulation:spell/run/shape_tick/turret_type/kill
return 1
