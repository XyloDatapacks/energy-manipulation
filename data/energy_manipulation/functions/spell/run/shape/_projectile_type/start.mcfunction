# in: "energy_manipulation:op shape_data" {power, custom_model_data}
# in "#xem.spell.run.shape.expire_time xem.op" (ticks)

# get motion
data modify storage energy_manipulation:op macro_data set value {motion_x:0,motion_y:0,motion_z:0}
execute unless data storage energy_manipulation:op selected_concatenate.concatenate.shape.movement{value:"none"} run function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op shape_data
# get owner
data modify storage energy_manipulation:op macro_data.owner set from storage energy_manipulation:op running_spell_data.caster_int
data modify storage energy_manipulation:op macro_data.shooter set from storage energy_manipulation:op running_spell_data.caster
# summon and apply data
function energy_manipulation:spell/run/shape/_projectile_type/summon with storage energy_manipulation:op macro_data

# pass shape to spell_marker
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.shape set from storage energy_manipulation:op selected_concatenate.concatenate.shape
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.shape.effect.intensity set from storage energy_manipulation:op shape_data.intensity

# deactivate spell marker and add tags
data modify storage energy_manipulation:op temp_array set value ["xem.spell.inactive","xem.spell.shape_marker","xem.spell.projectile_type"]
data modify storage energy_manipulation:op running_spell_marker_update.Tags append from storage energy_manipulation:op temp_array[]


# expire_time 
scoreboard players operation #xem.spell.run.shape.expire_time xem.op += #xlib.time xlib.op
scoreboard players add #xem.spell.run.shape.expire_time xem.op 1
scoreboard players operation @s xem.spell.shape.expire_time = #xem.spell.run.shape.expire_time xem.op


#increase "xem.spell.casting_fatigue.projectiles_casted_in_tick" for caster
function energy_manipulation:spell/run/shape/_projectile_type/increase_projectiles_counter with storage energy_manipulation:op running_spell_data
