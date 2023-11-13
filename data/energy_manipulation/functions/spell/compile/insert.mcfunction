$function energy_manipulation:spell/compile/new_concatenate/$(key) {path:"$(path)"}

$execute if score #xem.r.b1.is_final xem.op matches 0 run data modify storage energy_manipulation:op concatenate.$(path).$(key) set value {}
$execute if score #xem.r.b1.is_final xem.op matches 0 run data modify storage energy_manipulation:op concatenate.$(path).$(key).value set from storage energy_manipulation:op spell_build[0].value
$execute if score #xem.r.b1.is_final xem.op matches 1 run data modify storage energy_manipulation:op concatenate.$(path).$(key) set from storage energy_manipulation:op spell_build[0].value
$execute store result score #xem.spell.compile.insert.cost xem.op run data get storage energy_manipulation:spell nodes_values.$(key)[{value:$(value)}].cost 100
scoreboard players operation #xem.spell.compile.total_cost xem.op += #xem.spell.compile.insert.cost xem.op
