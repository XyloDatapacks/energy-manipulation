# pay
function energy_manipulation:spell/cost/pay with storage energy_manipulation:op spell_effect
execute unless score #xem.spell.cost.energy.cost_payed xem.op matches 1 run return 0

# run spell
data modify storage energy_manipulation:op spell_effect.target_entity set from storage energy_manipulation:op self_shape_targets[0].uuid
function energy_manipulation:spell/run/effect/start

# loop
data remove storage energy_manipulation:op self_shape_targets[0]
scoreboard players remove #xem.spell.run.shape.self.objects_count xem.op 1
execute if score #xem.spell.run.shape.self.objects_count xem.op matches 1.. run function energy_manipulation:spell/run/shape/self/loop