scoreboard players set #xem.jar_of_energy.block.withdraw.count xem.op 0
scoreboard players reset #xem.jar_of_energy.block.withdraw.type xem.op

tag @s add xem.jar_of_energy.block.withdraw
scoreboard players set xem.jar_of_energy.block.withdraw.loop xem.op 100
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:jar_of_energy/block/withdraw/loop
tag @s remove xem.jar_of_energy.block.withdraw


