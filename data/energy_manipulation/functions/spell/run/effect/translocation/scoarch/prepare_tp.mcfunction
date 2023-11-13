# tp data
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_input_position_in set from entity @s data.energy_manipulation.position
function energy_manipulation:spell/run/getters/macro_input/position 
data modify storage energy_manipulation:op macro_data.dimension set from entity @s data.energy_manipulation.dimension

# tp
function energy_manipulation:spell/run/effect/translocation/scoarch/tp with storage energy_manipulation:op macro_data