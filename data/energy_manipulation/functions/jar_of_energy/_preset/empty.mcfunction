# fill
execute store result storage energy_manipulation:op temp_data int 1 run scoreboard players set #xem.jar_of_energy.fill.last_count xem.op 0

# calc percentage
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op = #xem.jar_of_energy.fill.last_count xem.op
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op *= #100 xconst
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op /= #xem.const.jar_of_energy.fill.limit xem.op


