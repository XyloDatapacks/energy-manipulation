data remove storage energy_manipulation:op macro_data
execute store result score #xem.spell.display.content.get_node_values.instructions_count xem.op store result storage energy_manipulation:op macro_data.array_index int 1 run data get storage energy_manipulation:op display_content_node_parent.array_index
execute if score #xem.spell.display.content.get_node_values.instructions_count xem.op >= @s xem.spell.book.open_book_max_instructions run function energy_manipulation:spell/display/content/get_node_values/purge_values/instruction/check_if_is_last with storage energy_manipulation:op macro_data

# cleare incompatible
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.key set from storage energy_manipulation:op display_content_node_parent.key
function energy_manipulation:spell/display/content/get_node_values/purge_values/instruction/remove_incompatible with storage energy_manipulation:op macro_data
