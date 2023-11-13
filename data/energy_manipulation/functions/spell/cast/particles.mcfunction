# particles
execute store result score #xem.spell.cast.energy_type xem.op run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.energy_type_id
execute if score #xem.spell.cast.energy_type xem.op matches 1 run particle minecraft:dust 0.576 0.145 0.035 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force
execute if score #xem.spell.cast.energy_type xem.op matches 2 run particle minecraft:dust 0.361 0.886 0.078 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force
execute if score #xem.spell.cast.energy_type xem.op matches 3 run particle minecraft:dust 0.059 0.675 0.753 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force
execute if score #xem.spell.cast.energy_type xem.op matches 4 run particle minecraft:dust 0.016 0.376 0.306 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force
execute if score #xem.spell.cast.energy_type xem.op matches 5 run particle minecraft:dust 0.678 0.102 0.741 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force