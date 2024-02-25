#> energy_manipulation:spell/run/getters/target/selector/_operations/target/find
# @within: energy_manipulation:spell/run/getters/target/selector/target
# @macro: uuid

# get target uuid (return if not found)
scoreboard players set #xem.spell.run.getters.target.selector.target.found xem.op 0
$execute as $(uuid) on target store success score #xem.spell.run.getters.target.selector.target.found xem.op run function xylo_library:utilities/uuid/generate
execute if score #xem.spell.run.getters.target.selector.target.found xem.op matches 0 run return 0

# generate target
data modify storage energy_manipulation:op target_out set value [{uuid:""}]
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

# validate target
function energy_manipulation:spell/run/getters/target/validate_uuid/start