# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

execute unless data storage xylo_items:op register_item_selected_item{tag:{xylo:{id:"energy_manipulation:scrying_ward"}}} run return 0

function xylo_library:utilities/uuid/generate
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.uuid set from storage gu:main out
function energy_manipulation:trinket/scrying_ward/unmark/remove with storage energy_manipulation:op macro_data