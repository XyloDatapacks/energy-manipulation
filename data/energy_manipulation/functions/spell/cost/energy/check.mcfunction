# -> {cost,type}
# out: #xem.spell.cost.energy.cost_payed xem.op
# out: #xem.spell.cost.remaining_cost xem.op

#get remaining cost
execute store result score #xem.spell.cost.remaining_cost xem.op run data get storage energy_manipulation:op energy_cost.cost

# generic energy (if function result is -1 or 1 i return that value. 0 means that the function did not run: type=!generic)
$execute store result score #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op run function energy_manipulation:spell/cost/energy/$(type) with storage energy_manipulation:op energy_cost
execute unless score #xem.spell.cost.remaining_cost xem.op matches 1.. run return run scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1

# find the cost that got paied
$execute store result score #xem.spell.cost.energy.cost_actually_paid xem.op run clear @s minecraft:charcoal{xylo:{id:"energy_manipulation:$(type)_energy"}} $(cost)
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.energy.cost_actually_paid xem.op 








#==<Update Cost Status>==#

# update cost in storage
execute store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op

# if remaining cost is > 1 then i did not pay. so return 0
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0
# if energy was enough return cost_payed 1 (and return 1)
return run scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
