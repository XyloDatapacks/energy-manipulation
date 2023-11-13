execute store result score #xem.spell.display.content.get_concatenate.build_index xem.op run data get storage energy_manipulation:op temp_array[-1].build_index
execute if score #xem.spell.display.content.get_concatenate.build_index xem.op < @s xem.spell.display.index_input run scoreboard players set #xem.spell.display.content.get_concatenate.concat_count xem.op 0

scoreboard players remove #xem.spell.display.content.get_concatenate.concat_count xem.op 1
data remove storage energy_manipulation:op temp_array[-1]
execute if score #xem.spell.display.content.get_concatenate.concat_count xem.op matches 1.. run function energy_manipulation:spell/display/content/get_concatenate/loop_prev