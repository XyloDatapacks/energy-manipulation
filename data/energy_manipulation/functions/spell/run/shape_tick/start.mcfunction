# if player died end shape
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run scoreboard players operation @s xem.spell.shape.expire_time = #xlib.time xlib.op

# particles
function energy_manipulation:spell/run/shape_tick/particles

# sort
execute if entity @s[tag=xem.spell.projectile_type] run return run function energy_manipulation:spell/run/shape_tick/projectile_type/start
execute if entity @s[tag=xem.spell.turret_type] run return run function energy_manipulation:spell/run/shape_tick/turret_type/start
execute if entity @s[tag=xem.spell.aoe_type] run return run function energy_manipulation:spell/run/shape_tick/aoe_type/start

# exit
return 0