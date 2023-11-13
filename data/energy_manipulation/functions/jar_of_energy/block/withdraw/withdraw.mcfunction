#end loop
execute unless score xem.jar_of_energy.block.withdraw.loop xem.op matches 1.. run return 0
scoreboard players set xem.jar_of_energy.block.withdraw.loop xem.op 0

#remove
scoreboard players set #xem.jar_of_energy.block.withdraw.count xem.op 16
scoreboard players operation @s xem.jar_of_energy.energy_count -= #xem.jar_of_energy.block.withdraw.count xem.op
#get overfolw
scoreboard players operation #xem.jar_of_energy.block.withdraw.overflow xem.op = @s xem.jar_of_energy.energy_count
#limit jar energy
scoreboard players operation @s xem.jar_of_energy.energy_count > #0 xconst
#get the number of items actually extracted
execute if score #xem.jar_of_energy.block.withdraw.overflow xem.op matches ..-1 run scoreboard players operation #xem.jar_of_energy.block.withdraw.count xem.op += #xem.jar_of_energy.block.withdraw.overflow xem.op

#energy count display
function energy_manipulation:jar_of_energy/block/jar_display



#execute if entity @s[tag=xem.jar_of_energy.sun] run scoreboard players set #xem.jar_of_energy.block.withdraw.type xem.op 1
#execute if entity @s[tag=xem.jar_of_energy.ground] run scoreboard players set #xem.jar_of_energy.block.withdraw.type xem.op 2
#execute if entity @s[tag=xem.jar_of_energy.soul] run scoreboard players set #xem.jar_of_energy.block.withdraw.type xem.op 3
#execute if entity @s[tag=xem.jar_of_energy.dark] run scoreboard players set #xem.jar_of_energy.block.withdraw.type xem.op 4
#execute if entity @s[tag=xem.jar_of_energy.void] run scoreboard players set #xem.jar_of_energy.block.withdraw.type xem.op 5

#execute if score #xem.jar_of_energy.block.withdraw.type xem.op matches 1 run loot give @s loot energy_manipulation:jar_of_energy/block/withdraw/sun
#execute if score #xem.jar_of_energy.block.withdraw.type xem.op matches 2 run loot give @s loot energy_manipulation:jar_of_energy/block/withdraw/ground
#execute if score #xem.jar_of_energy.block.withdraw.type xem.op matches 3 run loot give @s loot energy_manipulation:jar_of_energy/block/withdraw/soul
#execute if score #xem.jar_of_energy.block.withdraw.type xem.op matches 4 run loot give @s loot energy_manipulation:jar_of_energy/block/withdraw/dark
#execute if score #xem.jar_of_energy.block.withdraw.type xem.op matches 5 run loot give @s loot energy_manipulation:jar_of_energy/block/withdraw/void

execute if entity @s[tag=xem.jar_of_energy.sun] run loot spawn ~ ~0.1 ~ loot energy_manipulation:jar_of_energy/block/withdraw/sun
execute if entity @s[tag=xem.jar_of_energy.ground] run loot spawn ~ ~0.1 ~ loot energy_manipulation:jar_of_energy/block/withdraw/ground
execute if entity @s[tag=xem.jar_of_energy.soul] run loot spawn ~ ~0.1 ~ loot energy_manipulation:jar_of_energy/block/withdraw/soul
execute if entity @s[tag=xem.jar_of_energy.dark] run loot spawn ~ ~0.1 ~ loot energy_manipulation:jar_of_energy/block/withdraw/dark
execute if entity @s[tag=xem.jar_of_energy.void] run loot spawn ~ ~0.1 ~ loot energy_manipulation:jar_of_energy/block/withdraw/void




#sound
execute at @s run playsound energy_manipulation:jar_of_energy.block.empty block @a ~ ~ ~ 1 1