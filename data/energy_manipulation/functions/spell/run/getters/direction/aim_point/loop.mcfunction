execute if score #xem.spell.run.getters.direction.aim_point.loop xem.op matches 1 run function energy_manipulation:spell/run/getters/direction/aim_point/apply_rotation
execute unless block ~ ~ ~ #xylo_library:no_hitbox positioned ^ ^ ^0.1 run function energy_manipulation:spell/run/getters/direction/aim_point/apply_rotation
execute positioned ~-0.25 ~-0.25 ~-0.25 as @e[type=!#xylo_library:non_interactive,dy=0,tag=!xem.spell.caster,tag=!xlib.non_interactive] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dy=0] positioned ~0.75 ~0.75 ~0.75 run function energy_manipulation:spell/run/getters/direction/aim_point/apply_rotation

scoreboard players remove #xem.spell.run.getters.direction.aim_point.loop xem.op 1
execute if score #xem.spell.run.getters.direction.aim_point.loop xem.op matches 1.. positioned ^ ^ ^0.1 run function energy_manipulation:spell/run/getters/direction/aim_point/loop