# in: "energy_manipulation:op position_in"

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.index set from storage energy_manipulation:op position_in.location_index
data modify storage energy_manipulation:op macro_data.caster set from storage energy_manipulation:op running_spell_data.caster
function energy_manipulation:spell/run/getters/position/location/get_location with storage energy_manipulation:op macro_data