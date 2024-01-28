# save in target origin_uuid
data modify storage energy_manipulation:op target_out[-1].origin_uuid set from storage energy_manipulation:op target_out[-1].uuid
# set clone uuid as macro and target uuid 
$data modify storage energy_manipulation:op target_out[-1].uuid set from storage energy_manipulation:data players[{uuid:$(uuid)}].mind.meditation.clone.hitbox_hex_uuid

