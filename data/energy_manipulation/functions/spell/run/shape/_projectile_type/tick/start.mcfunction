#dead caster stop
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return run execute at @s on vehicle run function energy_manipulation:spell/run/shape/_projectile_type/tick/spell_fail

# conditions and expire time
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op on vehicle at @s run return run function energy_manipulation:spell/run/shape/_projectile_type/tick/hit
execute on vehicle if predicate xylo_projectiles:hit at @s run return run function energy_manipulation:spell/run/shape/_projectile_type/tick/hit

# movement mode (on projectile)
execute on vehicle on vehicle if entity @s[tag=xem.spell.run.shape._movement.seek] run function energy_manipulation:spell/run/shape/_movement/seek/tick 

# projectile correction (for display)
execute on vehicle run function xylo_projectiles:position_correction/tick/start
# fix marker rotation too
execute at @s on vehicle rotated as @s on passengers run tp @s[type=minecraft:marker,tag=xem.spell.projectile_type] ~ ~ ~ ~ ~