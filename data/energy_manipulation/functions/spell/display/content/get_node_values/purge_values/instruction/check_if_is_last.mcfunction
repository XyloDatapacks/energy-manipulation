# {array_index}

$execute store success score #xem.spell.display.content.get_node_values.is_last_instruction xem.op if data storage energy_manipulation:op display_content_node{instruction_index:$(array_index)}
execute if score #xem.spell.display.content.get_node_values.is_last_instruction xem.op matches 1 run data modify storage energy_manipulation:op spell_display set value [{}]
execute if score #xem.spell.display.content.get_node_values.is_last_instruction xem.op matches 1 run data modify storage energy_manipulation:op spell_display[0] set from storage energy_manipulation:spell nodes_values.instruction[0]
