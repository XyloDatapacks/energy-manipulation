# -> {type}
# out: #xem.spell.cost.energy.cost_payed xem.op
# out: #xem.spell.cost.remaining_cost xem.op

#exit
execute if score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 1
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

#energy count display
function energy_manipulation:jar_of_energy/block/jar_display

#remove amount paid
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.jar_block.to_pay xem.op

# if remaining cost is > 1 then i did not pay. so return 0
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.remaining_cost xem.op
execute if score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 0

# if has enough energy (return value)
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
return 1


