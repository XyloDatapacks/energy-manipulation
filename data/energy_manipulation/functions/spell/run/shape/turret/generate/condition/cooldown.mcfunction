# tag
data modify storage energy_manipulation:op running_spell_marker_update.Tags append value "xem.spell.turret_type.cond.cooldown"

# cooldown
execute store result score @s xem.spell.shape.cooldown_time run data get storage energy_manipulation:op selected_concatenate.concatenate.shape.condition.timer 20
# activation time
scoreboard players operation #xem.spell.run.shape.activation_time xem.op = @s xem.spell.shape.cooldown_time
scoreboard players operation #xem.spell.run.shape.activation_time xem.op += #xlib.time xlib.op
scoreboard players operation @s xem.spell.shape.activation_time = #xem.spell.run.shape.activation_time xem.op
# cooldown time has to be at least one, else spell will not activate again in fire_mode->condition
scoreboard players operation @s xem.spell.shape.cooldown_time > #1 xconst
