execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=minecraft:interaction,dy=0,tag=xem.jar_of_energy.block] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dy=0] positioned ~0.95 ~0.95 ~0.95 on vehicle run function energy_manipulation:jar_of_energy/block/withdraw/withdraw
scoreboard players remove xem.jar_of_energy.block.withdraw.loop xem.op 1

execute if score xem.jar_of_energy.block.withdraw.loop xem.op matches 1.. positioned ^ ^ ^0.1 run function energy_manipulation:jar_of_energy/block/withdraw/loop