# -> {caster, index}

data remove storage energy_manipulation:op temp_data
$data modify storage energy_manipulation:op temp_data set from storage energy_manipulation:data players[{uuid:"$(caster)"}].locations[{index:$(index)}]
data modify storage energy_manipulation:op position_out set from storage energy_manipulation:op temp_data.position
data modify storage energy_manipulation:op position_out_dimension set from storage energy_manipulation:op temp_data.dimension
