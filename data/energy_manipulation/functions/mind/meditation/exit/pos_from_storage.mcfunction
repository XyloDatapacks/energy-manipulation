# -> {out}

# get data from storage
data remove storage energy_manipulation:op macro_data
$data modify storage energy_manipulation:op macro_data append from storage xylo_library:data players[{uuid:$(out)}].clone[{tags:["xem.mind.meditation.entity"]}]
data modify storage energy_manipulation:op macro_data set from storage energy_manipulation:op macro_data[-1]
$data remove storage xylo_library:data players[{uuid:$(out)}].clone[{tags:["xem.mind.meditation.entity"]}]

# tp
function energy_manipulation:mind/meditation/exit/pos_from_storage_tp with storage energy_manipulation:op macro_data
