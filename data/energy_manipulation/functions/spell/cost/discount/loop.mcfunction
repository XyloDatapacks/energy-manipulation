execute if predicate energy_manipulation:spell/cost/discount/has_to_pay run scoreboard players add #xem.spell.cost.discount.exit_cost xem.op 1

scoreboard players remove #xem.spell.cost.discount.tot_cost xem.op 1
execute if score #xem.spell.cost.discount.tot_cost xem.op matches 1.. run function energy_manipulation:spell/cost/discount/loop