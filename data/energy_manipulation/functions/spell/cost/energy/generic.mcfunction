# out: #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op (-1 not payed, 1 payed)
# *out: #xem.spell.cost.energy.cost_payed xem.op (1 if payed, else keep value)

# init
scoreboard players set #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op -1
# check
function energy_manipulation:spell/cost/energy/generic_check with storage energy_manipulation:op energy_cost
execute if score #xem.spell.cost.energy.concatenate_cost_paid_generic xem.op matches 1 run scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
