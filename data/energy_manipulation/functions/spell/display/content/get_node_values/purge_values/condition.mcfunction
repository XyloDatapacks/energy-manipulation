# remove effects incompatible with that shape
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op display_content_node_parent.value
function energy_manipulation:spell/display/content/get_node_values/purge_values/condition/remove_incompatible with storage energy_manipulation:op macro_data