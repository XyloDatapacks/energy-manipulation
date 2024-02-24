#> energy_manipulation:spell/run/getters/target/selector/_operations/attacker/find
# @within: energy_manipulation:spell/run/getters/target/selector/attacker
# @macro: uuid

# get attacker uuid (return if not found)
scoreboard players set #xem.spell.run.getters.target.selector.attacker.found xem.op 0
$execute as $(uuid) on attacker store success score #xem.spell.run.getters.target.selector.attacker.found xem.op run function xylo_library:utilities/uuid/generate
execute if score #xem.spell.run.getters.target.selector.attacker.found xem.op matches 0 run return 0

# generate target
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

# validate target
function energy_manipulation:spell/run/getters/target/validate_uuid/start