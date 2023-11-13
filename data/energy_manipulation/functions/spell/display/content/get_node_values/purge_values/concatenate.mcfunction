# get number of concatenate node
data remove storage energy_manipulation:op spell_build_concatenate_nodes
data modify storage energy_manipulation:op spell_build_concatenate_nodes append from storage energy_manipulation:op spell_build[{key:"concatenate"}]
execute store result score #xem.spell.display.content.get_node_values.concatenates_count xem.op run data get storage energy_manipulation:op spell_build_concatenate_nodes

# check
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.array_index int 1 run scoreboard players remove #xem.spell.display.content.get_node_values.concatenates_count xem.op 1
execute if score #xem.spell.display.content.get_node_values.concatenates_count xem.op >= @s xem.spell.book.open_book_max_concatenates run function energy_manipulation:spell/display/content/get_node_values/purge_values/concatenate/check_if_is_last with storage energy_manipulation:op macro_data
