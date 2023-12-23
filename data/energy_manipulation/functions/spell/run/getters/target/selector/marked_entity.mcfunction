scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.caster set from storage energy_manipulation:op running_spell_data.caster
function energy_manipulation:spell/run/getters/target/selector/marked_entities_get with storage energy_manipulation:op macro_data

execute if data storage energy_manipulation:op {target:{selection:"single"},target_in:{entity_index:"all"}} run data modify storage energy_manipulation:op target_in.entity_index set value 1
execute if data storage energy_manipulation:op target_in{entity_index:"all"} run data modify storage energy_manipulation:op target_out append from storage energy_manipulation:op temp_marked_entities[]
execute unless data storage energy_manipulation:op target_in{entity_index:"all"} run function energy_manipulation:spell/run/getters/target/selector/marked_entity_index with storage energy_manipulation:op target_in

execute unless data storage energy_manipulation:op target_out run return 0

# confirm entity found
data modify storage energy_manipulation:op elements_array set from storage energy_manipulation:op target_out
function energy_manipulation:spell/run/getters/target/validate_uuid/_array_validation
data modify storage energy_manipulation:op target_out set from storage energy_manipulation:op elements_array
execute store success score xem.spell.run.getters.target.found xem.op run data get storage energy_manipulation:op elements_array[-1].uuid
execute unless score xem.spell.run.getters.target.found xem.op matches 1 run data remove storage energy_manipulation:op target_out

