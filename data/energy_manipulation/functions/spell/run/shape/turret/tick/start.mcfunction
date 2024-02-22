#dead caster stop
execute if score #xem.spell.run.caster_still_alive xem.op matches 0 run return run function energy_manipulation:spell/run/shape/turret/tick/spell_fail

# movement mode
execute on vehicle if entity @s[tag=xem.spell.run.shape._movement.follow] run function energy_manipulation:spell/run/shape/_movement/follow/tick 

# conditions
execute if score @s[tag=xem.spell.turret_type.cond.cooldown] xem.spell.shape.activation_time <= #xlib.time xlib.op at @s run function energy_manipulation:spell/run/shape/turret/tick/condition/cooldown/check
execute if score @s[tag=xem.spell.turret_type.cond.target] xem.spell.shape.activation_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape/turret/tick/condition/target/check
# expire time
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape/turret/tick/kill


#terminate condition
execute if entity @s[tag=xem.spell.turret_type.terminate.condition] run function energy_manipulation:spell/run/shape/turret/tick/terminate/check
