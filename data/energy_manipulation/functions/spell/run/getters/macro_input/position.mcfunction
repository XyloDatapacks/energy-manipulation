# in: "energy_manipulation:op macro_input_position_in"
# $(position_x) $(position_y) $(position_z)

data modify storage energy_manipulation:op macro_data merge value {position_x:0.0d,position_y:0.0d,position_z:0.0d}
data modify storage energy_manipulation:op macro_data.position_x set from storage energy_manipulation:op macro_input_position_in[0]
data modify storage energy_manipulation:op macro_data.position_y set from storage energy_manipulation:op macro_input_position_in[1]
data modify storage energy_manipulation:op macro_data.position_z set from storage energy_manipulation:op macro_input_position_in[2]
