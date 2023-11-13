scoreboard players operation #xem.spell.display.content.get_concatenate.build_index xem.op = @s xem.spell.display.index_input
data modify storage energy_manipulation:op temp_array set value []
data modify storage energy_manipulation:op temp_array append from storage energy_manipulation:op spell_build[{key:"concatenate"}]
execute store result score #xem.spell.display.content.get_concatenate.concat_count xem.op run data get storage energy_manipulation:op temp_array
execute if score #xem.spell.display.content.get_concatenate.concat_count xem.op matches 1.. run function energy_manipulation:spell/display/content/get_concatenate/loop_prev

scoreboard players operation @s xem.spell.display.index_input = #xem.spell.display.content.get_concatenate.build_index xem.op