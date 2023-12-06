# if player died end shape
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run scoreboard players operation @s xem.spell.shape.expire_time = #xlib.time xlib.op

# particles
function energy_manipulation:spell/run/shape_tick/particles

# exit condition
scoreboard players set #xem.spell.run.shape_tick.tick_run xem.op 0
# sort
execute if entity @s[tag=xem.spell.projectile_type] run function energy_manipulation:spell/run/shape_tick/projectile_type/start
execute if score #xem.spell.run.shape_tick.tick_run xem.op matches 1 run return 1
execute if entity @s[tag=xem.spell.turret_type] run function energy_manipulation:spell/run/shape_tick/turret_type/start
execute if score #xem.spell.run.shape_tick.tick_run xem.op matches 1 run return 1
execute if entity @s[tag=xem.spell.aoe_type] run function energy_manipulation:spell/run/shape_tick/aoe_type/start
execute if score #xem.spell.run.shape_tick.tick_run xem.op matches 1 run return 1
# exit
return 0