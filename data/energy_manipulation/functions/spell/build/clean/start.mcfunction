scoreboard players set #xem.spell.build.clean.build_index xem.op -1
scoreboard players set #xem.spell.build.clean.concatenate_index xem.op -1
execute store result score #xem.e.i1.spell.build.clean.numb xem.op run data get storage energy_manipulation:op spell_build
execute if score #xem.e.i1.spell.build.clean.numb xem.op matches 1.. run function energy_manipulation:spell/build/clean/loop
