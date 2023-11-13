# get position to look at
data modify storage energy_manipulation:op position_in set from storage energy_manipulation:op direction_in.position
function energy_manipulation:spell/run/getters/position/get
execute unless data storage energy_manipulation:op position_out run return 0

# face position
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position

data modify storage energy_manipulation:op macro_input_position_in set from storage energy_manipulation:op position_out
function energy_manipulation:spell/run/getters/macro_input/position

execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/facing/xlm.rotate with storage energy_manipulation:op macro_data
