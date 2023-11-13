# in: "energy_manipulation:op target_in", "energy_manipulation:op initial_position"
# out: "energy_manipulation:op target_out"
# out: "xem.spell.run.getters.target.found xem.op"
# {sort, distance:{value,min_distance,max_distance}, selection, value, feature}

# success sb
scoreboard players set xem.spell.run.getters.target.found xem.op 0

# reset output
data remove storage energy_manipulation:op target_out

# return if no target
execute if data storage energy_manipulation:op target_in{value:"none"} run return 0

# get from uuid
scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 0
execute if data storage energy_manipulation:op target_in{value:"subject"} run function energy_manipulation:spell/run/getters/target/selector/subject
execute if data storage energy_manipulation:op target_in{value:"caster"} run function energy_manipulation:spell/run/getters/target/selector/caster
execute if data storage energy_manipulation:op target_in{value:"objects"} run function energy_manipulation:spell/run/getters/target/selector/objects
execute if data storage energy_manipulation:op target_in{value:"marked_entity"} run function energy_manipulation:spell/run/getters/target/selector/marked_entity
execute if score #xem.spell.run.getters.target.got_from_uuid xem.op matches 1 run return 1

# set target storage
data modify storage energy_manipulation:op target set value {feature:"none"}
data modify storage energy_manipulation:op target merge from storage energy_manipulation:op target_in
# set distance
data remove storage energy_manipulation:op target.distance
data modify storage energy_manipulation:op target merge value {min_distance:"0",max_distance:""}
data modify storage energy_manipulation:op target.min_distance set from storage energy_manipulation:op target_in.distance.min_distance
data modify storage energy_manipulation:op target.max_distance set from storage energy_manipulation:op target_in.distance.max_distance
# limit
execute if data storage energy_manipulation:op target{selection:"single"} run data modify storage energy_manipulation:op target.selection set value ",limit=1"
execute if data storage energy_manipulation:op target{selection:"multiple"} run data modify storage energy_manipulation:op target.selection set value ""
# get selector
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op target.value
function energy_manipulation:spell/run/getters/target/selector with storage energy_manipulation:op macro_data
# get target
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
data modify storage energy_manipulation:op target merge from storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/target/uuid with storage energy_manipulation:op target