# -> {value}
# out: "energy_manipulation:spell shape_effect_cost"

data remove storage energy_manipulation:spell shape_effect_cost
$data modify storage energy_manipulation:spell temp_dict set from storage energy_manipulation:spell nodes_values.effect[{value:$(value)}]
data modify storage energy_manipulation:spell shape_effect_cost.cost set from storage energy_manipulation:spell temp_dict.cost
data modify storage energy_manipulation:spell shape_effect_cost.type set from storage energy_manipulation:spell temp_dict.energy_type
