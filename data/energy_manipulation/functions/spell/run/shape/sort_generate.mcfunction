# get shape data
$data modify storage energy_manipulation:op shape_data set from storage energy_manipulation:spell nodes_values.shape[{value:"$(value)"}].data
# run shape function
$execute in $(dimension) positioned 0.0 0.0 0.0 positioned ~$(initial_position_x) ~$(initial_position_y) ~$(initial_position_z) rotated $(initial_rotation_yawn) $(initial_rotation_pitch) run function energy_manipulation:spell/run/shape/$(value)/generate/start
