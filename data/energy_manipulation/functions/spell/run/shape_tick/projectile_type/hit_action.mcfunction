# remove tags
tag @s remove xem.spell.inactive
tag @s remove xem.spell.shape_marker
tag @s remove xem.spell.projectile_type

# position
ride @s dismount
tp @s ^ ^ ^ ~ ~

scoreboard players operation xem.spell.run.getters.target.found xem.op = xproj.position_correction.hit_entity xproj.op

# get target
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data remove storage energy_manipulation:op target_out
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op target_out set value [{uuid:""}]
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op target_out[0].uuid set from storage xylo_projectiles:op entity_hit.uuid

# reroute
scoreboard players set #xem.spell.run.getters.target._reroute.selector_type xem.op 1
scoreboard players set #xem.spell.run.getters.target._reroute.max_iterations xem.op 3
function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]
execute if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run data remove storage energy_manipulation:op target_out
execute if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run scoreboard players set xem.spell.run.getters.target.found xem.op 0

# update objects
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify entity @s data.energy_manipulation.spell_data.objects set from storage energy_manipulation:op target_out

# generic spell data
data modify storage energy_manipulation:op projectile_type_hit_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op projectile_type_hit_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op projectile_type_hit_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op projectile_type_hit_data.data.energy_manipulation.spell_data

# effect data
data remove storage energy_manipulation:op spell_effect
data modify storage energy_manipulation:op spell_effect.effect set from storage energy_manipulation:op projectile_type_hit_data.data.energy_manipulation.shape.effect
data modify storage energy_manipulation:op spell_effect.caster set from storage energy_manipulation:op projectile_type_hit_data.data.energy_manipulation.spell_data.caster
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op spell_effect.target_entity set from storage energy_manipulation:op target_out[0].uuid
# run effect
function energy_manipulation:spell/run/effect/start

# run elaborate
tp @s ^ ^ ^-0.3 ~ ~
function energy_manipulation:spell/run/elaborate/start 
