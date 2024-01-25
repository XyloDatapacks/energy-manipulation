# save in target origin_uuid
data modify storage energy_manipulation:op target_out[0].origin_uuid set from storage energy_manipulation:op macro_data.uuid
# set clone uuid as macro and target uuid 
data remove storage energy_manipulation:op expanding_entity_clones_list
$data modify storage energy_manipulation:op expanding_entity_clones_list append from storage xylo_library:data players[{uuid:$(uuid)}].clone[{tags:["xem.mind.meditation.entity"]}]
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op expanding_entity_clones_list[-1].hitbox_uuid

data modify storage energy_manipulation:op target_out[0].uuid set from storage energy_manipulation:op macro_data.uuid 

say ooo