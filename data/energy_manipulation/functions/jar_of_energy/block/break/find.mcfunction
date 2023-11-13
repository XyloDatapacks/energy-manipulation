tag @s add xem.jar_of_energy.block.break
scoreboard players set xem.jar_of_energy.block.break.loop xem.op 100
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:jar_of_energy/block/break/loop
tag @s remove xem.jar_of_energy.block.break
