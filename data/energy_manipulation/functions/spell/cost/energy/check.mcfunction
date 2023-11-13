# -> {cost,type}
# out: #xem.spell.cost.energy.cost_payed xem.op
# out: #xem.spell.cost.remaining_cost xem.op

#get remaining cost
$scoreboard players set #xem.spell.cost.remaining_cost xem.op $(cost)

# generic energy (if function result is -1 or 1 i return that value. 0 means that the function did not run: type=!generic)
scoreboard players set #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op 0
$function energy_manipulation:spell/cost/energy/$(type)
execute if score #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op matches -1 run return 0
execute if score #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op matches 1 run return 1

# find the cost that got paied
$execute store result score #xem.spell.cost.energy.cost_actually_paid xem.op run clear @s minecraft:charcoal{xylo:{id:"energy_manipulation:$(type)_energy"}} $(cost)
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.energy.cost_actually_paid xem.op 








# if remaining cost is > 1 then i did not pay. so return 0
#execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0

# if has enough energy (return value)
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
return 1
