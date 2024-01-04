# -> {cost,type}
# out: #xem.spell.cost.energy.cost_payed xem.op
# out: #xem.spell.cost.remaining_cost xem.op

#get remaining cost
execute store result score #xem.spell.cost.remaining_cost xem.op run data get storage energy_manipulation:op energy_cost.cost

# get jars matching energy_type
data modify storage energy_manipulation:op temp_player_inventory set from entity @s Inventory
data remove storage energy_manipulation:op jars_in_inventory
execute store success score #xem.spell.cost.jar.is_generic xem.op if data storage energy_manipulation:op energy_cost{type:"generic"}
$execute if score #xem.spell.cost.jar.is_generic xem.op matches 0 run data modify storage energy_manipulation:op jars_in_inventory append from storage energy_manipulation:op temp_player_inventory[{tag:{xylo:{id:"energy_manipulation:jar_of_$(type)_energy"}}}]
execute if score #xem.spell.cost.jar.is_generic xem.op matches 1 run data modify storage energy_manipulation:op jars_in_inventory append from storage energy_manipulation:op temp_player_inventory[{tag:{xylo:{id_tags:["energy_manipulation:jar_of_energy"]}}}]
data remove storage energy_manipulation:op jars_in_inventory[{tag:{energy_manipulation:{energy_count:0}}}]

# prepare to loop
execute store result score #xem.spell.cost.jar.jar_count xem.op run data get storage energy_manipulation:op jars_in_inventory
execute unless score #xem.spell.cost.jar.jar_count xem.op matches 1.. run return 0
# loop
scoreboard players set #xem.spell.cost.energy.cost_actually_paid xem.op 0
execute if score #xem.spell.cost.jar.jar_count xem.op matches 1.. run function energy_manipulation:spell/cost/jar/loop



#==<Update Cost Status>==#

# update cost in storage
execute store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op

# if remaining cost is > 1 then i did not pay. so return 0
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0
# if energy was enough return cost_payed 1 (and return 1)
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
return 1
