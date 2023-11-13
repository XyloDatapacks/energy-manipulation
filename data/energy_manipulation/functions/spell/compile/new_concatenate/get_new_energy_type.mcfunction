# get energy type from effect
$data modify storage energy_manipulation:op compile_energy_type.type set from storage energy_manipulation:spell nodes_values.effect[{value:"$(value)"}].energy_type

