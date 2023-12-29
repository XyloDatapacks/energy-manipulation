scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1
execute unless data storage energy_manipulation:op running_spell_data.caster run return 0

data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage energy_manipulation:op running_spell_data.caster





# confirm entity found with distance check
scoreboard players set #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op 1
execute store success score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op unless data storage energy_manipulation:op target_in.distance{value:"none"}
data modify storage energy_manipulation:op validate_uuid set from storage energy_manipulation:op target_out[-1].uuid
execute if data storage energy_manipulation:op target_out[-1].uuid run function energy_manipulation:spell/run/getters/target/validate_uuid/start
# if fail clear target_out
execute if score xem.spell.run.getters.target.found xem.op matches 0 run data remove storage energy_manipulation:op target_out
scoreboard players reset #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op