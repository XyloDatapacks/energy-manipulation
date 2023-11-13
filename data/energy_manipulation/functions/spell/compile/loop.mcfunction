execute store result score #xem.r.b1.is_final xem.op run data get storage energy_manipulation:op spell_build[0].final
function energy_manipulation:spell/compile/insert with storage energy_manipulation:op spell_build[0]
data remove storage energy_manipulation:op spell_build[0]
scoreboard players remove #xem.e.i1.spell.compile.numb xem.op 1
execute if score #xem.e.i1.spell.compile.numb xem.op matches 1.. run function energy_manipulation:spell/compile/loop
