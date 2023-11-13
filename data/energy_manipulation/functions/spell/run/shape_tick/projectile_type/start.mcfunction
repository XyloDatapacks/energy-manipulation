# hit 
# confirm run tick
scoreboard players set #xem.spell.run.shape_tick.tick_run xem.op 1

# conditions and expire time
scoreboard players set #xem.spell.run.shape_tick.projectile_type.hit xem.op 0
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op on vehicle at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 0 on vehicle if predicate energy_manipulation:spell/shape/projectile_type/hit at @s run function energy_manipulation:spell/run/shape_tick/projectile_type/hit
execute if score #xem.spell.run.shape_tick.projectile_type.hit xem.op matches 1 run return 1

# projectile correction (for display)
execute on vehicle run function xylo_projectiles:position_correction/tick/start
