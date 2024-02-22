# if player died end shape
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run scoreboard players operation @s xem.spell.shape.expire_time = #xlib.time xlib.op

# particles
function energy_manipulation:spell/run/shape/_particles

# sort
$function energy_manipulation:spell/run/shape/$(value)/tick/start
