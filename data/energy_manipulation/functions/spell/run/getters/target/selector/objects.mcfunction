scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

execute if data storage energy_manipulation:op {target:{selection:"single"},target_in:{index:"all"}} run data modify storage energy_manipulation:op target_in.index set value 0
execute if data storage energy_manipulation:op target_in{index:"all"} run data modify storage energy_manipulation:op target_out append from storage energy_manipulation:op running_spell_data.objects[]
execute unless data storage energy_manipulation:op target_in{index:"all"} run function energy_manipulation:spell/run/getters/target/selector/objects_index with storage energy_manipulation:op target_in

execute unless data storage energy_manipulation:op target_out run return 0

# confirm entity found
data modify storage energy_manipulation:op elements_array set from storage energy_manipulation:op target_out
function energy_manipulation:spell/run/getters/target/validate_uuid/_array_validation
data modify storage energy_manipulation:op target_out set from storage energy_manipulation:op elements_array
execute store success score xem.spell.run.getters.target.found xem.op run data get storage energy_manipulation:op target_out[-1].uuid

