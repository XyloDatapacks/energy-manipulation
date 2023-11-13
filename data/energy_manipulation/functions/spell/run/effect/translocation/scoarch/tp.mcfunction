# -> {uuid, position_x, position_y, position_z}

$execute as @a[dy=1,dx=0,dz=0] unless score @s xem.spell.run.effect.translocation.scoarch_cooldown > #xlib.time xlib.op rotated as @s in $(dimension) positioned $(position_x) $(position_y) $(position_z) run function energy_manipulation:spell/run/effect/translocation/tp_execute

