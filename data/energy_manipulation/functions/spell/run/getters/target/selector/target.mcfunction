#> energy_manipulation:spell/run/getters/target/selector/target

scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

# i have to first find the caster, so if it is missing i return
execute unless data storage energy_manipulation:op running_spell_data.caster run return 0

# find eventual target
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op running_spell_data.caster
function energy_manipulation:spell/run/getters/target/selector/_operations/target/find with storage energy_manipulation:op macro_data
