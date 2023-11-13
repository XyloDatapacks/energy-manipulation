# in: "energy_manipulation:op energy_cost" {cost,type}
# out: #xem.spell.cost.energy.cost_payed xem.op

# tellraw @a[tag=xem.debug] ["",{"storage":"energy_manipulation:op","nbt":"energy_cost.cost","color":"aqua"}]

#==<EXIT CONDITIONS>==#

# return (fail) if dead
execute if score @s xem.spell.cost.died matches 1 store result score #xem.spell.cost.energy.cost_payed xem.op run return 0
# creative
execute if entity @s[gamemode=creative] store result score #xem.spell.cost.energy.cost_payed xem.op run return 1

#==<ARMOR DISCOUNT>==#

# tellraw @a[tag=xem.debug] ["in: ",{"storage":"energy_manipulation:op","nbt":"energy_cost.cost","color":"aqua"}]
# mastery discount
function energy_manipulation:spell/cost/discount/start with storage energy_manipulation:op energy_cost
# tellraw @a[tag=xem.debug] ["out: ",{"storage":"energy_manipulation:op","nbt":"energy_cost.cost","color":"aqua"}]

#==<TRY TO PAY>==#
# all this functions as first thing make sure to set "#xem.spell.cost.remaining_cost xem.op" 
# if they pay some cost, they update the value

# init
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 0
#placed jar (if fails to pay full cost: updates energy_manipulation:op energy_cost.cost)
execute align x align y align z positioned ~-20 ~-20 ~-20 as @e[type=minecraft:interaction,dx=40,dy=40,dz=40,tag=xem.jar_of_energy.block,sort=nearest] on vehicle if score @s xem.jar_of_energy.energy_count matches 1.. run function energy_manipulation:spell/cost/jar_block/check with storage energy_manipulation:op energy_cost
# jar (if fails to pay full cost: updates energy_manipulation:op energy_cost.cost)
execute if entity @s[type=minecraft:player] unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run function energy_manipulation:spell/cost/jar/check with storage energy_manipulation:op energy_cost
# energy (does not update energy_manipulation:op energy_cost.cost cause it is the last option)
execute if entity @s[type=minecraft:player] unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run function energy_manipulation:spell/cost/energy/check with storage energy_manipulation:op energy_cost

#==<FAILED TO PAY>==#

# withering (in: #xem.spell.cost.remaining_cost xem.op)
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run function energy_manipulation:spell/cost/withering/calc
