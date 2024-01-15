# remove tags
tag @s remove xem.spell.inactive
tag @s remove xem.spell.shape_marker
tag @s remove xem.spell.projectile_type

# position
ride @s dismount
tp @s ^ ^ ^ ~ ~


# validate target uuid since it was get from external library (it might be a rerouth entity)
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data remove storage energy_manipulation:op target_in
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage energy_manipulation:op target_out set value [{uuid:""}]
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run data modify storage energy_manipulation:op target_out[0].uuid set from storage xylo_projectiles:op entity_hit.uuid
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run scoreboard players set #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op 1
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/start
execute if score xproj.position_correction.hit_entity xproj.op matches 1 run scoreboard players reset #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op

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
