# input: energy_manipulation:op spell_build
# output: energy_manipulation:op spell

# init cost
scoreboard players set #xem.spell.compile.total_cost xem.op 0
data modify storage energy_manipulation:op compile_energy_type.type set value "generic"

# concatenate discount
data modify storage energy_manipulation:op temp_array set value []
data modify storage energy_manipulation:op temp_array append from storage energy_manipulation:op spell_build[{key:"concatenate"}]
execute store result score #xem.spell.compile.concat_discount_perc xem.op run data get storage energy_manipulation:op temp_array
scoreboard players remove #xem.spell.compile.concat_discount_perc xem.op 2
scoreboard players operation #xem.spell.compile.concat_discount_perc xem.op *= #8 xconst
scoreboard players operation #xem.spell.compile.concat_discount_perc xem.op > #0 xconst

# compile
data modify storage energy_manipulation:op spell set value []
data modify storage energy_manipulation:op concatenate set value {}
data modify storage energy_manipulation:op spell_build[{key:"program"}].value set value []
data remove storage energy_manipulation:op spell_build[{key:"instruction",value:"none"}]
execute store result score #xem.e.i1.spell.compile.numb xem.op run data get storage energy_manipulation:op spell_build
execute if score #xem.e.i1.spell.compile.numb xem.op matches 1.. run function energy_manipulation:spell/compile/loop
data remove storage energy_manipulation:op spell[0]
