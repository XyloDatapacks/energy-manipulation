# -> {cost,type}

$scoreboard players operation #xem.spell.cost.discount.mastery_lvl xem.op = @s xem.spell.armor.mastery.$(type)
execute unless score #xem.spell.cost.discount.mastery_lvl xem.op matches 1.. run return 0

$scoreboard players set #xem.spell.cost.discount.tot_cost xem.op $(cost)
# tellraw @a[tag=xem.debug] [{"text":"init: "},{"score":{"name":"#xem.spell.cost.discount.tot_cost","objective":"xem.op"}}]

#probabilità
scoreboard players operation #xem.spell.cost.discount.mastery_prob xem.op = #100 xconst
scoreboard players add #xem.spell.cost.discount.mastery_lvl xem.op 1
scoreboard players operation #xem.spell.cost.discount.mastery_prob xem.op /= #xem.spell.cost.discount.mastery_lvl xem.op
# tellraw @a[tag=xem.debug] [{"text":"prob: "},{"score":{"name":"#xem.spell.cost.discount.mastery_prob","objective":"xem.op"}}]

scoreboard players set #xem.spell.cost.discount.exit_cost xem.op 0
function energy_manipulation:spell/cost/discount/loop

#tellraw @a[tag=xem.debug] [{"text":"out: "},{"score":{"name":"#xem.spell.cost.discount.exit_cost","objective":"xem.op"}}]
execute store result storage energy_manipulation:op energy_cost.cost int 1 run scoreboard players get #xem.spell.cost.discount.exit_cost xem.op