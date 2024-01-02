# -> {caster}
# in: "energy_manipulation:op energy_cost" {cost,type} [read only]
# out: #xem.spell.cost.energy.cost_payed xem.op

scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 0
$execute as $(caster) run function energy_manipulation:spell/cost/execute
