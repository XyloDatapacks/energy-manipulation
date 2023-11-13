# in: "energy_manipulation:op elements_array"
# out: "energy_manipulation:op elements_array" (cleaned from invalid targets)

# copy data
execute store result score #xem.spell.run.getters.target.objects_numb xem.op run data get storage energy_manipulation:op elements_array
execute unless score #xem.spell.run.getters.target.objects_numb xem.op matches 1.. run return 0
# confirm entity found
execute store success score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op unless data storage energy_manipulation:op target_in.distance{value:"none"}
data modify storage energy_manipulation:op validate_uuid set from storage energy_manipulation:op elements_array[0].uuid
execute if data storage energy_manipulation:op elements_array[0].uuid run function energy_manipulation:spell/run/getters/target/validate_uuid/start
# cycle elements (erase if target not found)
execute if score xem.spell.run.getters.target.found xem.op matches 1 run data modify storage energy_manipulation:op elements_array append from storage energy_manipulation:op elements_array[0]
data remove storage energy_manipulation:op elements_array[0]
# loop
scoreboard players remove #xem.spell.run.getters.target.elements_numb xem.op 1
execute if score #xem.spell.run.getters.target.elements_numb xem.op matches 1.. run function energy_manipulation:spell/run/getters/target/validate_uuid/_array_loop

