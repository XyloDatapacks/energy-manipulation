# in: "energy_manipulation:op energy_cost"

#get remaining cost
execute store result score #xem.spell.cost.remaining_cost xem.op run data get storage energy_manipulation:op energy_cost.cost

#calc
scoreboard players operation @s xem.spell.raw_energy -= #xem.spell.cost.remaining_cost xem.op
scoreboard players set #xem.spell.cost.remaining_cost xem.op 0
execute if score @s xem.spell.raw_energy matches ..-1 run scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= @s xem.spell.raw_energy
scoreboard players operation @s xem.spell.raw_energy > #0 xconst

#==<Update Cost Status>==#

# update cost in storage
execute store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op

# if remaining cost is > 1 then i did not pay. so return 0
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0
# if energy was enough return cost_payed 1 (and return 1)
return run scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
