# get node (out: "energy_manipulation:op display_content_node")
$data modify storage energy_manipulation:op display_content_node set from storage energy_manipulation:op spell_build[$(index)]

# get list of possible values for the node (out: "energy_manipulation:op spell_display")
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.key set from storage energy_manipulation:op display_content_node.key
function energy_manipulation:spell/display/content/get_node_values/get_values2 with storage energy_manipulation:op macro_data

# get parent (out: "energy_manipulation:op display_content_node_parent")
data modify storage energy_manipulation:op macro_data set from storage energy_manipulation:op display_content_node.parent
function energy_manipulation:spell/display/content/get_node_values/get_parent_node with storage energy_manipulation:op macro_data

# remove from spell_display effects incompatible with the shape
execute if data storage energy_manipulation:op display_content_node{key:"effect"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/effect
# dont allow more instructions if count > "xem.spell.book.open_book_max_instructions"
execute if data storage energy_manipulation:op display_content_node{key:"instruction"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/instruction
# dont allow more concatenate if count > "xem.spell.book.open_book_max_concatenates"
execute if data storage energy_manipulation:op display_content_node{key:"concatenate"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/concatenate
# remove from spell_display movements incompatible with the shape
execute if data storage energy_manipulation:op display_content_node{key:"movement"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/movement
# remove from spell_display conditions incompatible with parent
execute if data storage energy_manipulation:op display_content_node{key:"condition"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/condition
# remove from spell_display features incompatible with parent
execute if data storage energy_manipulation:op display_content_node{key:"feature"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/feature
# remove from spell_display targets incompatible with parent
execute if data storage energy_manipulation:op display_content_node{key:"target"} run function energy_manipulation:spell/display/content/get_node_values/purge_values/target

