execute if score #xlib.time xlib.op >= @s xem.mind.meditation.end_time positioned ~-0.5 ~ ~-0.5 on origin if entity @s[dx=0,dz=0,dy=1,tag=xem.mind.meditation.is_meditating] run function energy_manipulation:mind/meditation/exit/start
execute on origin if entity @s[distance=32..,tag=xem.mind.meditation.is_meditating] run function energy_manipulation:mind/meditation/exit/start
