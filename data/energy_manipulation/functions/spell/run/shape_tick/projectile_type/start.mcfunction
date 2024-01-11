# confirm run tick
scoreboard players set #xem.spell.run.shape_tick.tick_run xem.op 1

#dead caster stop
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 at @s on vehicle run function energy_manipulation:spell/run/shape_tick/projectile_type/spell_fail
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return 0

# movement mode (on projectile)
execute on vehicle on vehicle if entity @s[tag=xem.spell.run.shape._movement.seek] run function energy_manipulation:spell/run/shape/_movement/seek/tick 
execute store result entity @s Air short 1 run scoreboard players get #xlib.timer.2tick xlib.op


# conditions and expire time
scoreboard players set #xem.spell.run.shape_tick.projectile_type.hit xem.op 0
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op on vehicle at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 0 on vehicle if predicate energy_manipulation:spell/shape/projectile_type/hit at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 1 run return 1

# projectile correction (for display)
execute on vehicle run function xylo_projectiles:position_correction/tick/start
