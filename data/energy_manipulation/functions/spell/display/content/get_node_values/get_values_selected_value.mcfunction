# call get_node_values first
# -> {index} : @s xem.spell.display.node_index_input
# out : energy_manipulation:op node_value

$data modify storage energy_manipulation:op node_value set from storage energy_manipulation:op spell_display[$(index)]
