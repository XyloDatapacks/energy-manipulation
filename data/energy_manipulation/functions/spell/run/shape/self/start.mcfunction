# get target
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op selected_concatenate.concatenate.shape.target
function energy_manipulation:spell/run/getters/target/get

data remove storage energy_manipulation:op self_shape_targets
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op self_shape_targets set from storage energy_manipulation:op target_out 

# update objects
data modify storage energy_manipulation:op running_spell_data.objects set from storage energy_manipulation:op self_shape_targets 

# prepare to run effect
data remove storage energy_manipulation:op spell_effect
data modify storage energy_manipulation:op spell_effect.effect set from storage energy_manipulation:op selected_concatenate.concatenate.shape.effect
data modify storage energy_manipulation:op spell_effect.caster set from storage energy_manipulation:op running_spell_data.caster
execute store result score #xem.spell.run.shape.self.objects_count xem.op run data get storage energy_manipulation:op self_shape_targets

# first target
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op spell_effect.target_entity set from storage energy_manipulation:op self_shape_targets[0].uuid
function energy_manipulation:spell/run/effect/start

# other objects
scoreboard players remove #xem.spell.run.shape.self.objects_count xem.op 1
execute if score #xem.spell.run.shape.self.objects_count xem.op matches 1.. run function energy_manipulation:spell/run/shape/_utility/get_effect_cost with storage energy_manipulation:op selected_concatenate.concatenate.shape.effect.value
execute if score #xem.spell.run.shape.self.objects_count xem.op matches 1.. run data modify storage energy_manipulation:op energy_cost set from storage energy_manipulation:spell shape_effect_cost
execute if score #xem.spell.run.shape.self.objects_count xem.op matches 1.. run data remove storage energy_manipulation:op self_shape_targets[0]
execute if score #xem.spell.run.shape.self.objects_count xem.op matches 1.. run function energy_manipulation:spell/run/shape/self/loop

# block if failed to pay for extra objects
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 0
