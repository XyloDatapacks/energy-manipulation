# -> {i, index}

$data modify storage energy_manipulation:op spell_display_data.k$(i) set value "generic"

$execute store result score #xem.spell.display.content.get_data.node_cost.cost xem.op run data get storage energy_manipulation:op spell_display[$(index)].cost 100
$execute unless score #xem.spell.display.content.get_data.node_cost.cost xem.op matches 0 store result storage energy_manipulation:op spell_display_data.cost_$(i) double 0.01 run scoreboard players get #xem.spell.display.content.get_data.node_cost.cost xem.op
$execute unless score #xem.spell.display.content.get_data.node_cost.cost xem.op matches 0 run data modify storage energy_manipulation:op spell_display_data.cost_type_$(i) set value "generic"
$execute unless score #xem.spell.display.content.get_data.node_cost.cost xem.op matches 0 run data modify storage energy_manipulation:op spell_display_data.cost_type_$(i) set from storage energy_manipulation:op spell_display[$(index)].energy_type
