# -> {type}
# out: #xem.spell.cost.energy.cost_payed xem.op
# out: #xem.spell.cost.remaining_cost xem.op

# make sure not to pay if the cost has been paid by the previous jar
execute if score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 1
# make sure not to execute code on a wrong jar
$execute unless entity @s[tag=xem.jar_of_energy.$(type)] run return 0

#get remaining cost
execute store result score #xem.spell.cost.remaining_cost xem.op run data get storage energy_manipulation:op energy_cost.cost

#remove
scoreboard players operation #xem.spell.cost.jar_block.to_pay xem.op = #xem.spell.cost.remaining_cost xem.op
scoreboard players operation @s xem.jar_of_energy.energy_count -= #xem.spell.cost.jar_block.to_pay xem.op
#get overfolw
scoreboard players operation #xem.spell.cost.jar_block.overflow xem.op = @s xem.jar_of_energy.energy_count
#limit jar energy
scoreboard players operation @s xem.jar_of_energy.energy_count > #0 xconst
#get the number of energy actually paid
execute if score #xem.spell.cost.jar_block.overflow xem.op matches ..-1 run scoreboard players operation #xem.spell.cost.jar_block.to_pay xem.op += #xem.spell.cost.jar_block.overflow xem.op

#update energy count display
function energy_manipulation:jar_of_energy/block/jar_display

#remove amount paid
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.jar_block.to_pay xem.op

#==<Update Cost Status>==#

# update cost in storage
execute store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op

# if remaining cost is > 1 then i did not pay. so return 0
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0
# if energy was enough return cost_payed 1 (and return 1)
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
return 1


