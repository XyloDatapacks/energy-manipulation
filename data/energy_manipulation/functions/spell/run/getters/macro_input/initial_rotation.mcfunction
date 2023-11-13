# in: "energy_manipulation:op initial_rotation"
# $(initial_rotation_yawn) $(initial_rotation_pitch)

data modify storage energy_manipulation:op macro_data merge value {initial_rotation_yawn:0.0f,initial_rotation_pitch:0.0f}
data modify storage energy_manipulation:op macro_data.initial_rotation_yawn set from storage energy_manipulation:op initial_rotation[0]
data modify storage energy_manipulation:op macro_data.initial_rotation_pitch set from storage energy_manipulation:op initial_rotation[1]
