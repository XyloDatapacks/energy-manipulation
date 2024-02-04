# check energy amount (same as for other energy types)
$execute store result score #xem.spell.cost.energy.cost_actually_paid xem.op run clear @s minecraft:charcoal{xylo:{id_tags:["energy_manipulation:energy"]}} $(cost)
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.energy.cost_actually_paid xem.op 
