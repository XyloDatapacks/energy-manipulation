# in: "energy_manipulation:op instruction"

data modify storage energy_manipulation:op get_value_in set from storage energy_manipulation:op instruction.get_value
function energy_manipulation:spell/run/getters/get_value/get

execute store result score #xem.spell.run.elaborate.instruction.counter.value xem.op run data get storage energy_manipulation:op get_value_out 100
execute store result score #xem.spell.run.elaborate.instruction.counter.counter xem.op run data get storage energy_manipulation:op running_spell_data.counter 100

execute if data storage energy_manipulation:op instruction{value:"set"} store result storage energy_manipulation:op running_spell_data.counter double 0.01 run scoreboard players operation #xem.spell.run.elaborate.instruction.counter.counter xem.op = #xem.spell.run.elaborate.instruction.counter.value xem.op
execute if data storage energy_manipulation:op instruction{value:"add"} store result storage energy_manipulation:op running_spell_data.counter double 0.01 run scoreboard players operation #xem.spell.run.elaborate.instruction.counter.counter xem.op += #xem.spell.run.elaborate.instruction.counter.value xem.op
execute if data storage energy_manipulation:op instruction{value:"multiply"} store result storage energy_manipulation:op running_spell_data.counter double 0.0001 run scoreboard players operation #xem.spell.run.elaborate.instruction.counter.counter xem.op *= #xem.spell.run.elaborate.instruction.counter.value xem.op
scoreboard players operation #xem.spell.run.elaborate.instruction.counter.counter xem.op *= #100 xconst
execute if data storage energy_manipulation:op instruction{value:"divide"} store result storage energy_manipulation:op running_spell_data.counter double 0.01 run scoreboard players operation #xem.spell.run.elaborate.instruction.counter.counter xem.op /= #xem.spell.run.elaborate.instruction.counter.value xem.op

