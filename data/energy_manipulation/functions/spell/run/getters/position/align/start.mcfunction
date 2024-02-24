# in: "energy_manipulation:op position_in"
# out: "energy_manipulation:op position_out"

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.align set from storage energy_manipulation:op position_in.axis
function energy_manipulation:spell/run/getters/macro_input/initial_position

execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/position/align/xlm.align with storage energy_manipulation:op macro_data
