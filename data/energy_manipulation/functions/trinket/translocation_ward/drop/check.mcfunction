scoreboard players set #xem.trinket.translocation_ward.drop.check xem.op 0
execute on passengers on attacker run scoreboard players set #xem.trinket.translocation_ward.drop.check xem.op 1
execute if score #xem.trinket.translocation_ward.drop.check xem.op matches 1 on vehicle run kill @s
execute if score #xem.trinket.translocation_ward.drop.check xem.op matches 1 run tp @s ~ -1000 ~
execute if score #xem.trinket.translocation_ward.drop.check xem.op matches 1 on passengers run kill @s
execute if score #xem.trinket.translocation_ward.drop.check xem.op matches 1 run kill @s