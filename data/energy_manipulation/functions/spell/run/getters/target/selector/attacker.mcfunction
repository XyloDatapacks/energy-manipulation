#> energy_manipulation:spell/run/getters/target/selector/attacker

scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

# i have to first find the caster, so if it is missing i return
execute unless data storage energy_manipulation:op running_spell_data.caster run return 0

# check reroute for caster
data modify storage energy_manipulation:op target_out set value [{uuid:""}]
data modify storage energy_manipulation:op target_out[0].uuid set from storage energy_manipulation:op running_spell_data.caster
scoreboard players set #xem.spell.run.getters.target._reroute.selector_type xem.op 2
scoreboard players set #xem.spell.run.getters.target._reroute.max_iterations xem.op 3
function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]
execute if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run return run data remove storage energy_manipulation:op target_out

# find eventual attacker
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op target_out[-1].uuid
function energy_manipulation:spell/run/getters/target/selector/_operations/attacker/find with storage energy_manipulation:op macro_data
