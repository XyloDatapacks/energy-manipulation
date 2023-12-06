# set new activation time
scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.fire_rate

# generic spell data
data modify storage energy_manipulation:op aoe_type_activation_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op aoe_type_activation_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op aoe_type_activation_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.spell_data

#get targets
data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.target_aoe
data modify storage energy_manipulation:op target_in.volume_check set value "cube"
data modify storage energy_manipulation:op target_in.size set from storage energy_manipulation:op aoe_type_activation_data.data.energy_manipulation.shape.size
function energy_manipulation:spell/run/getters/target/get

#targets
data remove storage energy_manipulation:op aoe_shape_targets
data modify storage energy_manipulation:op aoe_shape_targets set from storage energy_manipulation:op target_out
execute store result score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op run data get storage energy_manipulation:op aoe_shape_targets

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
execute if score #xem.spell.run.shape_tick.aoe_type.objects_count xem.op matches 1.. run function energy_manipulation:spell/run/shape_tick/aoe_type/loop_effect