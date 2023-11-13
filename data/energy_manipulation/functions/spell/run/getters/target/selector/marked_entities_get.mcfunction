# -> {caster}

data remove storage energy_manipulation:op temp_marked_entities
$data modify storage energy_manipulation:op temp_marked_entities set from storage energy_manipulation:data players[{uuid:"$(caster)"}].marked_entities

