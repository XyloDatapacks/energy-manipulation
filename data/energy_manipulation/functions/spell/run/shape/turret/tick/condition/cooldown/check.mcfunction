# setup spell to run
execute at @s run function energy_manipulation:spell/run/shape/turret/tick/run_spell

# set new activation time
execute if entity @s[tag=xem.spell.turret_type.fm.once] run scoreboard players operation @s xem.spell.shape.expire_time = #xlib.time xlib.op
execute if entity @s[tag=xem.spell.turret_type.fm.condition,tag=xem.spell.turret_type.cond.cooldown,tag=!xem.spell.turret_type.cond.none] run scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.cooldown_time
execute if entity @s[tag=xem.spell.turret_type.fm.repeat] run scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.fire_rate

