scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

execute if data storage energy_manipulation:op {target:{selection:"single"},target_in:{index:"all"}} run data modify storage energy_manipulation:op target_in.index set value 0
execute if data storage energy_manipulation:op target_in{index:"all"} run data modify storage energy_manipulation:op target_out append from storage energy_manipulation:op running_spell_data.objects[]
execute unless data storage energy_manipulation:op target_in{index:"all"} run function energy_manipulation:spell/run/getters/target/selector/objects_index with storage energy_manipulation:op target_in
execute store success score #xem.spell.run.getters.target.selector.objects.use_counter xem.op if data storage energy_manipulation:op target_in{index:"counter"}
execute if score #xem.spell.run.getters.target.selector.objects.use_counter xem.op matches 1 run data remove storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.selector.objects.use_counter xem.op matches 1 run data modify storage energy_manipulation:op macro_data.index set from storage energy_manipulation:op running_spell_data.counter
execute if score #xem.spell.run.getters.target.selector.objects.use_counter xem.op matches 1 run function energy_manipulation:spell/run/getters/target/selector/objects_index with storage energy_manipulation:op macro_data

execute unless data storage energy_manipulation:op target_out run return 0

# validate targets
function energy_manipulation:spell/run/getters/target/validate_uuid/start
