data remove storage energy_manipulation:op macro_data

# if target is descendent of effect, it will "effect" in it's path. the position will be ["main.concatenate." + "concatenate." * parent_concatenate_index + "shape."] resulting in inxed (17 + 12*n + 6) = (23 + 12*n). the end index is the start index + 6 (effect has 6 letters)
execute store result score #xem.spell.display.content.get_node_values.purge_values.target.start xem.op run data get storage energy_manipulation:op display_content_node.parent_concatenate_index
scoreboard players operation #xem.spell.display.content.get_node_values.purge_values.target.start xem.op *= #12 xconst
execute store result storage energy_manipulation:op macro_data.start int 1 run scoreboard players add #xem.spell.display.content.get_node_values.purge_values.target.start xem.op 23

scoreboard players operation #xem.spell.display.content.get_node_values.purge_values.target.end xem.op = #xem.spell.display.content.get_node_values.purge_values.target.start xem.op
execute store result storage energy_manipulation:op macro_data.end int 1 run scoreboard players add #xem.spell.display.content.get_node_values.purge_values.target.end xem.op 6

function energy_manipulation:spell/display/content/get_node_values/purge_values/target/remove_subject with storage energy_manipulation:op macro_data
