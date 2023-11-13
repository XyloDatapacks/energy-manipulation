# -> {start, end}

data remove storage energy_manipulation:op temp_string
$data modify storage energy_manipulation:op temp_string set string storage energy_manipulation:op display_content_node.path $(start) $(end)
execute unless data storage energy_manipulation:op {temp_string:"effect"} run data remove storage energy_manipulation:op spell_display[{value:"subject"}]
