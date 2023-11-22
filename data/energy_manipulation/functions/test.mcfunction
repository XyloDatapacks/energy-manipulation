data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.x set from storage xylo_retina:output ContactCoordinates[0]
data modify storage energy_manipulation:op macro_data.y set from storage xylo_retina:output ContactCoordinates[1]
data modify storage energy_manipulation:op macro_data.z set from storage xylo_retina:output ContactCoordinates[2]
function energy_manipulation:testa with storage energy_manipulation:op macro_data