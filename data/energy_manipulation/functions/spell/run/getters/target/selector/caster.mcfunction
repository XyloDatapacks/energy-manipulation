#> energy_manipulation:spell/run/getters/target/selector/caster

scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1
execute unless data storage energy_manipulation:op running_spell_data.caster run return 0

data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage energy_manipulation:op running_spell_data.caster


# validate targets
scoreboard players set #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op 1
function energy_manipulation:spell/run/getters/target/validate_uuid/start
scoreboard players reset #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op