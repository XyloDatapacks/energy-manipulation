# confirm run tick
scoreboard players set #xem.spell.run.shape_tick.tick_run xem.op 1

# movement mode
execute on vehicle if entity @s[tag=xem.spell.run.shape._movement.follow] run function energy_manipulation:spell/run/shape/_movement/follow/tick 

# conditions
execute if score @s[tag=xem.spell.turret_type.cond.cooldown] xem.spell.shape.activation_time <= #xlib.time xlib.op at @s run function energy_manipulation:spell/run/shape_tick/turret_type/condition/cooldown/check
execute if score @s[tag=xem.spell.turret_type.cond.target] xem.spell.shape.activation_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape_tick/turret_type/condition/target/check
# expire time
execute if score @s xem.spell.shape.expire_time <= #xlib.time xlib.op run function energy_manipulation:spell/run/shape_tick/turret_type/kill
