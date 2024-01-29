# -> {uuid}

$data remove storage energy_manipulation:data players[].marked_entities[{uuid:"$(uuid)"}]
$data remove storage energy_manipulation:data players[].marked_entities[{origin_uuid:"$(uuid)"}]