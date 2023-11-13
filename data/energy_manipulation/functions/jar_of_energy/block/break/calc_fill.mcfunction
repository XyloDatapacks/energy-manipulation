#apply modifier to update description
scoreboard players operation #xem.jar_of_energy.fill.last_count xem.op = @s xem.jar_of_energy.energy_count
# calc percentage
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op = #xem.jar_of_energy.fill.last_count xem.op
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op *= #100 xconst
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op /= #xem.const.jar_of_energy.fill.limit xem.op
#apply
item modify entity @s container.0 energy_manipulation:jar_of_energy/lore

#get and update data
data modify storage energy_manipulation:op jar set from entity @s item
execute store result storage energy_manipulation:op jar.tag.energy_manipulation.energy_count int 1 run scoreboard players get @s xem.jar_of_energy.energy_count


