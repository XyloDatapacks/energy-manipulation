# fill
execute store result score #xem.jar_of_energy.fill.last_count xem.op run random value 1..4 minecraft:entities/player
execute store result storage energy_manipulation:op temp_data int 1 run scoreboard players get #xem.jar_of_energy.fill.last_count xem.op

# calc percentage
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op = #xem.jar_of_energy.fill.last_count xem.op
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op *= #100 xconst
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op /= #xem.const.jar_of_energy.fill.limit xem.op


