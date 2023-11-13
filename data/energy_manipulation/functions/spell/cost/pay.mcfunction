# -> {caster}
# in: "energy_manipulation:op energy_cost" {cost,type} [read only]
# out: #xem.spell.cost.energy.cost_payed xem.op

$execute as $(caster) run function energy_manipulation:spell/cost/execute
