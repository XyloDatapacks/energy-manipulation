# in: "energy_manipulation:op initial_position"
# $(initial_position_x) $(initial_position_y) $(initial_position_z)

data modify storage energy_manipulation:op macro_data merge value {initial_position_x:0.0d,initial_position_y:0.0d,initial_position_z:0.0d}
data modify storage energy_manipulation:op macro_data.initial_position_x set from storage energy_manipulation:op initial_position[0]
data modify storage energy_manipulation:op macro_data.initial_position_y set from storage energy_manipulation:op initial_position[1]
data modify storage energy_manipulation:op macro_data.initial_position_z set from storage energy_manipulation:op initial_position[2]
