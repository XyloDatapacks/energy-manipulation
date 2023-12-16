execute summon minecraft:marker run function energy_manipulation:spell/run/elaborate/concatenate

scoreboard players remove #xem.spell.run.elaborate.split_count xem.op 1
execute if score #xem.spell.run.elaborate.split_count xem.op matches 1.. run function energy_manipulation:spell/run/elaborate/split_loop