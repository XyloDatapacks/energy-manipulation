# -> {out}

#save data in player storage
$data modify storage energy_manipulation:data players[{uuid:$(out)}].mind.meditation.position set from storage energy_manipulation:op macro_data

#save clone uuid
function xylo_library:utilities/uuid/generate
$data modify storage energy_manipulation:data players[{uuid:$(out)}].mind.meditation.clone set from storage gu:main out