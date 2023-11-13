#block place if looking at mob
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_interactive,dy=0,tag=!xem.jar_of_energy.place.player,tag=!xlib.non_interactive] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dy=0] run return 0
#place on smithed.block
execute positioned ^ ^ ^0.1 align x align y align z if entity @e[dy=0,tag=smithed.block] run scoreboard players set #xem.jar_of_energy.place.temp.loop.smithed_block xem.op 1
execute if score #xem.jar_of_energy.place.temp.loop.smithed_block xem.op matches 1 align x align y align z positioned ~0.5 ~ ~0.5 run function energy_manipulation:jar_of_energy/place/place
execute if score #xem.jar_of_energy.place.temp.loop.smithed_block xem.op matches 1 run return 0
#place on block
execute unless block ^ ^ ^0.1 #xylo_library:air_like align x align y align z unless entity @e[type=minecraft:interaction,dy=0,tag=xem.jar_of_energy.block] positioned ~0.5 ~ ~0.5 run function energy_manipulation:jar_of_energy/place/place
execute unless block ^ ^ ^0.1 #xylo_library:air_like run return 0

#loop
scoreboard players remove #xem.jar_of_energy.place.temp.loop xem.op 1
execute if score #xem.jar_of_energy.place.temp.loop xem.op matches 1.. positioned ^ ^ ^0.1 if block ^ ^ ^ #xylo_library:air_like run function energy_manipulation:jar_of_energy/place/loop