# particles
execute if score @s xem.spell.shape.expire_time > #xlib.time xlib.op run particle minecraft:dust 0.678 0.102 0.741 0.7 ~ ~1 ~ 0.1 0.5 0.1 1 1 force
execute if score @s xem.spell.shape.expire_time > #xlib.time xlib.op run particle minecraft:dust 0.373 0.039 0.439 0.7 ~ ~1 ~ 0.1 0.5 0.1 1 2 force
execute if score @s xem.spell.shape.expire_time > #xlib.time xlib.op run particle minecraft:reverse_portal ~ ~1 ~ 0.1 0.1 0.1 0.1 2 force

# tp players
execute if score @s xem.spell.shape.expire_time > #xlib.time xlib.op positioned ~-0.5 ~ ~-0.5 if entity @a[dy=1,dx=0,dz=0] run function energy_manipulation:spell/run/effect/translocation/scoarch/prepare_tp

# kill
execute unless score @s xem.spell.shape.expire_time > #xlib.time xlib.op run kill @s