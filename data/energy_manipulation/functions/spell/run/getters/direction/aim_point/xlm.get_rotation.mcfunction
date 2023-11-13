# get current position
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
# get looking position
data modify storage energy_manipulation:op macro_input_position_in set from entity @s Pos
function energy_manipulation:spell/run/getters/macro_input/position

# get direction
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/aim_point/xlm.get_rotation2 with storage energy_manipulation:op macro_data



