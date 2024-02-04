execute on attacker if entity @s[tag=!xem.jar_of_energy.block.break] run return fail

#end loop
execute unless score xem.jar_of_energy.block.break.loop xem.op matches 1.. run return fail
scoreboard players set xem.jar_of_energy.block.break.loop xem.op 0

#apply modifier to update description (sets "energy_manipulation:op jar")
execute on vehicle run function energy_manipulation:jar_of_energy/block/break/calc_fill

#drop item
summon minecraft:item ~ ~ ~ {Tags:["xem.jar_of_energy.block.break.drop"],Motion:[0.0d,0.2d,0.0d],PickupDelay:10s,Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}}}
data modify entity @e[type=minecraft:item,tag=xem.jar_of_energy.block.break.drop,distance=..0.1,limit=1] Item set from storage energy_manipulation:op jar
tag @e[type=minecraft:item,distance=..0.1] remove xem.jar_of_energy.block.break.drop
#kill jar
execute on vehicle run function energy_manipulation:jar_of_energy/block/break/kill


#sound
playsound energy_manipulation:jar_of_energy.block.break block @a ~ ~ ~ 1 1
