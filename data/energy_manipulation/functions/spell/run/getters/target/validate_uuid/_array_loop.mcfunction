# confirm entity found
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op elements_array[0].uuid
execute if data storage energy_manipulation:op elements_array[0].uuid run function energy_manipulation:spell/run/getters/target/validate_uuid/check with storage energy_manipulation:op macro_data
# cycle elements (erase if target not found)
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op elements_array append from storage energy_manipulation:op elements_array[0]
data remove storage energy_manipulation:op elements_array[0]
# loop
scoreboard players remove #xem.spell.run.getters.target.elements_numb xem.op 1
execute if score #xem.spell.run.getters.target.elements_numb xem.op matches 1.. run function energy_manipulation:spell/run/getters/target/validate_uuid/_array_loop