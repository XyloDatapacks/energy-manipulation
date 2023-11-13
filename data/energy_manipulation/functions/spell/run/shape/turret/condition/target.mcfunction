# tag
data modify storage energy_manipulation:op running_spell_marker_update.Tags append value "xem.spell.turret_type.cond.target"

# cooldown
scoreboard players add @s xem.spell.shape.cooldown_time 2
# activation time
scoreboard players operation #xem.spell.run.shape.activation_time xem.op = #xlib.time xlib.op
scoreboard players operation @s xem.spell.shape.activation_time = #xem.spell.run.shape.activation_time xem.op
