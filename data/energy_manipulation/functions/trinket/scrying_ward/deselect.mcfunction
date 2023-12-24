scoreboard players set xem.spell.run.getters.target.found xem.op 0

data modify storage energy_manipulation:op energy_cost set value {cost:1,type:"soul"}
function energy_manipulation:spell/cost/execute

