# set new activation time
scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.fire_rate

# generic spell data
data modify storage energy_manipulation:op aoe_type_activation_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op aoe_type_activation_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op aoe_type_activation_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.spell_data

# pay
execute store success score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op if entity @s[tag=!xem.spell.run.shape.aoe.first_run]
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run data remove storage energy_manipulation:op macro_data
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run data modify storage energy_manipulation:op macro_data.caster set from storage energy_manipulation:op running_spell_data.caster
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run function energy_manipulation:spell/run/shape/_utility/get_effect_cost with storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.effect
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run data modify storage energy_manipulation:op energy_cost set from storage energy_manipulation:spell shape_effect_cost
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run function energy_manipulation:spell/cost/pay with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.shape_tick.aoe_type.second_activation xem.op matches 1 run execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 0

#remove tag first run
tag @s remove xem.spell.run.shape.aoe.first_run

#get targets
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.target_aoe
data modify storage energy_manipulation:op target_in merge value {volume_check:"cube",selection:"multiple",ignore_focus:1b}
data modify storage energy_manipulation:op target_in.size set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.size
function energy_manipulation:spell/run/getters/target/get

#targets
data remove storage energy_manipulation:op aoe_shape_targets
data modify storage energy_manipulation:op aoe_shape_targets set from storage energy_manipulation:op target_out
execute store result score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op run data get storage energy_manipulation:op aoe_shape_targets

#pass objects
execute if score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op matches 1.. run data modify entity @s data.energy_manipulation.spell_data.objects set from storage energy_manipulation:op aoe_shape_targets

# effect data
data remove storage energy_manipulation:op spell_effect
data modify storage energy_manipulation:op spell_effect.effect set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.effect
data modify storage energy_manipulation:op spell_effect.caster set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.spell_data.caster
execute if score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op matches 1.. run data modify storage energy_manipulation:op spell_effect.target_entity set from storage energy_manipulation:op aoe_shape_targets[0].uuid
# run effect
function energy_manipulation:spell/run/effect/start
#exit if no more targets to apply effect to
execute unless score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op matches 2.. run return 1

# loop
data remove storage energy_manipulation:op aoe_shape_targets[0]
scoreboard players remove #xem.spell.run.shape_tick.aoe_type.objects_count xem.op 1
execute if score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op matches 1.. run function energy_manipulation:spell/run/shape/aoe/tick/loop_effect