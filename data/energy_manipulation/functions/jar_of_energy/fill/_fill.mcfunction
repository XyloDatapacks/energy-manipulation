# fill
execute store result score #xem.jar_of_energy.fill.last_count xem.op run data get entity @s SelectedItem.tag.energy_manipulation.energy_count
execute store result score #xem.jar_of_energy.fill.add xem.op run random value 1..4 minecraft:entities/player
scoreboard players operation #xem.jar_of_energy.fill.last_count xem.op += #xem.jar_of_energy.fill.add xem.op
execute store result storage energy_manipulation:op temp_data int 1 run scoreboard players operation #xem.jar_of_energy.fill.last_count xem.op < #xem.const.jar_of_energy.fill.limit xem.op

# calc percentage
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op = #xem.jar_of_energy.fill.last_count xem.op
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op *= #100 xconst
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op /= #xem.const.jar_of_energy.fill.limit xem.op

# modify item
item modify entity @s weapon.mainhand energy_manipulation:jar_of_energy/fill

