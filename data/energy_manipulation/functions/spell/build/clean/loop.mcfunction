# if no parent data -> has_parent = 1 cause parent is root
execute store success score #xem.e.i1.spell.build.clean.has_parent xem.op unless data storage energy_manipulation:op spell_build[0].parent
# if has parent && has value -> check for parent
execute if score #xem.e.i1.spell.build.clean.has_parent xem.op matches 0 if data storage energy_manipulation:op spell_build[0].value run function energy_manipulation:spell/build/clean/check with storage energy_manipulation:op spell_build[0].parent

# build_index
execute if score #xem.e.i1.spell.build.clean.has_parent xem.op matches 1 store result storage energy_manipulation:op spell_build[0].build_index int 1 run scoreboard players add #xem.spell.build.clean.build_index xem.op 1

# concatenate index
execute if data storage energy_manipulation:op spell_build[0].concatenate_index run scoreboard players add #xem.spell.build.clean.concatenate_index xem.op 1
execute store result storage energy_manipulation:op spell_build[0].parent_concatenate_index int 1 run scoreboard players get #xem.spell.build.clean.concatenate_index xem.op 

# cycle
execute if score #xem.e.i1.spell.build.clean.has_parent xem.op matches 1 run data modify storage energy_manipulation:op spell_build append from storage energy_manipulation:op spell_build[0]
data remove storage energy_manipulation:op spell_build[0]
# loop
scoreboard players remove #xem.e.i1.spell.build.clean.numb xem.op 1
execute if score #xem.e.i1.spell.build.clean.numb xem.op matches 1.. run function energy_manipulation:spell/build/clean/loop
