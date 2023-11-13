# in: "energy_manipulation:op instruction"

data modify storage energy_manipulation:op position_in set from storage energy_manipulation:op instruction
function energy_manipulation:spell/run/getters/position/get
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op position_out
# update dimension if "position_out_dimension" is valid
data modify storage energy_manipulation:op running_spell_data.dimension set from storage energy_manipulation:op position_out_dimension