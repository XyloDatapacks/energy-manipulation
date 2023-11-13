data remove storage energy_manipulation:op spell_build
data modify storage energy_manipulation:op spell_build set from storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_build
function energy_manipulation:spell/compile/start 
scoreboard players set xem.spell.cast.compiled xem.op 1
