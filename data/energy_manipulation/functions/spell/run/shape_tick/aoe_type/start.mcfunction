#dead caster stop
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return run function energy_manipulation:spell/run/shape_tick/aoe_type/spell_fail

#expand display
execute if score @s[tag=xem.spell.run.shape.aoe.expand] xem.spell.run.shape.aoe.expand_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape_tick/aoe_type/expand_model

# conditions
execute if score @s xem.spell.shape.activation_time <= #xlib.time xlib.op at @s run function energy_manipulation:spell/run/shape_tick/aoe_type/run_effect
# expire time
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape_tick/aoe_type/kill
