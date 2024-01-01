particle minecraft:dust 0.678 0.102 0.741 0.9 ~ ~ ~ 0.05 0.05 0.05 1 1 force
particle minecraft:dust 0.373 0.039 0.439 0.9 ~ ~ ~ 0.05 0.05 0.05 1 1 force

execute if entity @s[distance=..1] run return 1
scoreboard players add #xem.trinket.translocation_ward.anchor_fx.loop xem.op 1
execute if score #xem.trinket.translocation_ward.anchor_fx.loop xem.op matches ..64 positioned ^ ^ ^0.5 run function energy_manipulation:trinket/translocation_ward/anchor_fx/loop