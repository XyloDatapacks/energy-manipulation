# confirm run tick
scoreboard players set #xem.spell.run.shape_tick.tick_run xem.op 1

#dead caster stop
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 at @s on vehicle run function energy_manipulation:spell/run/shape_tick/projectile_type/spell_fail
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return 0

# conditions and expire time
scoreboard players set #xem.spell.run.shape_tick.projectile_type.hit xem.op 0
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op on vehicle at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 0 on vehicle if predicate energy_manipulation:spell/shape/projectile_type/hit at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 1 run return 1

# movement mode (on projectile)
execute on vehicle on vehicle if entity @s[tag=xem.spell.run.shape._movement.seek] run function energy_manipulation:spell/run/shape/_movement/seek/tick 

# projectile correction (for display)
execute on vehicle run function xylo_projectiles:position_correction/tick/start
# fix marker rotation too
execute at @s on vehicle rotated as @s on passengers run tp @s[type=minecraft:marker,tag=xem.spell.projectile_type] ~ ~ ~ ~ ~