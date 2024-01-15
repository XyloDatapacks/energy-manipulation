# override uuid with clone's one
data remove storage energy_manipulation:op macro_data.uuid
$data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:data players[{uuid:$(uuid)}].mind.meditation.clone
# continue check
function energy_manipulation:spell/run/getters/target/validate_uuid/check with storage energy_manipulation:op macro_data
