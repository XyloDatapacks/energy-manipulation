# position
data modify storage energy_manipulation:op position_out set from entity @s Pos

# get dimension
function xylo_library:utilities/get_dimension_id/get
data modify storage energy_manipulation:op position_out_dimension set from storage xylo_library:op get_dimension_id.dimension

kill @s
