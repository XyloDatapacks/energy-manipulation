# save in target origin_uuid
data modify storage energy_manipulation:op target_out[-1].origin_uuid set from storage energy_manipulation:op target_out[-1].uuid
# set clone uuid as macro and target uuid 
data modify storage energy_manipulation:op expanding_entity_clones_list set value [{hitbox_uuid:"n"}]
$data modify storage energy_manipulation:op expanding_entity_clones_list append from storage xylo_library:data players[{uuid:$(uuid)}].clone[{tags:["xem.mind.meditation.entity"]}]
data modify storage energy_manipulation:op target_out[-1].uuid set from storage energy_manipulation:op expanding_entity_clones_list[-1].hitbox_uuid
