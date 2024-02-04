#end loop
execute unless score xem.jar_of_energy.block.fill.loop xem.op matches 1.. run return 0
scoreboard players set xem.jar_of_energy.block.fill.loop xem.op 0

#check for energy type match
execute if entity @s[tag=xem.jar_of_energy.sun] unless data storage energy_manipulation:op temp_item.tag.xylo{id:"energy_manipulation:sun_energy"} run return fail
execute if entity @s[tag=xem.jar_of_energy.ground] unless data storage energy_manipulation:op temp_item.tag.xylo{id:"energy_manipulation:ground_energy"} run return fail
execute if entity @s[tag=xem.jar_of_energy.soul] unless data storage energy_manipulation:op temp_item.tag.xylo{id:"energy_manipulation:soul_energy"} run return fail
execute if entity @s[tag=xem.jar_of_energy.dark] unless data storage energy_manipulation:op temp_item.tag.xylo{id:"energy_manipulation:dark_energy"} run return fail
execute if entity @s[tag=xem.jar_of_energy.void] unless data storage energy_manipulation:op temp_item.tag.xylo{id:"energy_manipulation:void_energy"} run return fail

#get number to add
execute store result score #xem.jar_of_energy.block.fill.count xem.op run data get storage energy_manipulation:op temp_item.Count
#add
scoreboard players operation @s xem.jar_of_energy.energy_count += #xem.jar_of_energy.block.fill.count xem.op
#get overfolw
scoreboard players operation #xem.jar_of_energy.block.fill.overflow xem.op = @s xem.jar_of_energy.energy_count
scoreboard players operation #xem.jar_of_energy.block.fill.overflow xem.op -= #xem.const.jar_of_energy.fill.limit xem.op
#limit jar energy
scoreboard players operation @s xem.jar_of_energy.energy_count < #xem.const.jar_of_energy.fill.limit xem.op
#get the number of items actually inserted
execute if score #xem.jar_of_energy.block.fill.overflow xem.op matches 1.. run scoreboard players operation #xem.jar_of_energy.block.fill.count xem.op -= #xem.jar_of_energy.block.fill.overflow xem.op

#energy count display
function energy_manipulation:jar_of_energy/block/jar_display

#sound
execute at @s run playsound energy_manipulation:jar_of_energy.block.fill block @a ~ ~ ~ 1 1