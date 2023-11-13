scoreboard players set #xem.jar_of_energy.block.fill.count xem.op 0
data remove storage energy_manipulation:op temp_item
data modify storage energy_manipulation:op temp_item set from entity @s SelectedItem

tag @s add xem.jar_of_energy.block.fill
scoreboard players set xem.jar_of_energy.block.fill.loop xem.op 100
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:jar_of_energy/block/fill/loop
tag @s remove xem.jar_of_energy.block.fill

#remove from hand number of items actually inserted in jar
execute if score #xem.jar_of_energy.block.fill.count xem.op matches 1.. run item modify entity @s[gamemode=!creative] weapon.mainhand energy_manipulation:jar_of_energy/block/fill/remove_energy_from_player

