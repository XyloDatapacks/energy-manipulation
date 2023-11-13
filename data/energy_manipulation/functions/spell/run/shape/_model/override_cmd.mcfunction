# in: "energy_manipulation:op macro_data{shape}"

execute store result score #xem.spell.run.effect.none.particles xem.op run data get storage energy_manipulation:op running_spell_data.spell_book.energy_type_id
execute if score #xem.spell.run.effect.none.particles xem.op matches 1 run data modify storage energy_manipulation:op macro_data.energy_type set value "sun"
execute if score #xem.spell.run.effect.none.particles xem.op matches 2 run data modify storage energy_manipulation:op macro_data.energy_type set value "ground"
execute if score #xem.spell.run.effect.none.particles xem.op matches 3 run data modify storage energy_manipulation:op macro_data.energy_type set value "soul"
execute if score #xem.spell.run.effect.none.particles xem.op matches 4 run data modify storage energy_manipulation:op macro_data.energy_type set value "dark"
execute if score #xem.spell.run.effect.none.particles xem.op matches 5 run data modify storage energy_manipulation:op macro_data.energy_type set value "void"
function energy_manipulation:spell/run/shape/_model/get_cmd with storage energy_manipulation:op macro_data

