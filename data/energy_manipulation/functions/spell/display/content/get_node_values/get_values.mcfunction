# get node (out: "energy_manipulation:op display_content_node")
$data modify storage energy_manipulation:op display_content_node set from storage energy_manipulation:op spell_build[$(index)]

# get list of possible values for the node (out: "energy_manipulation:op spell_display")
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.key set from storage energy_manipulation:op display_content_node.key
function energy_manipulation:spell/display/content/get_node_values/get_values2 with storage energy_manipulation:op macro_data

# get parent (out: "energy_manipulation:op display_content_node_parent")
data modify storage energy_manipulation:op macro_data set from storage energy_manipulation:op display_content_node.parent
function energy_manipulation:spell/display/content/get_node_values/get_parent_node with storage energy_manipulation:op macro_data

#purge values
function energy_manipulation:spell/display/content/get_node_values/sort_purge_values with storage energy_manipulation:op display_content_node
