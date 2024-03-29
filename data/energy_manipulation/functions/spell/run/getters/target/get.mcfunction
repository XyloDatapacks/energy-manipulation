# in: "energy_manipulation:op target_in", "energy_manipulation:op initial_position"
# out: "energy_manipulation:op target_out"
# out: "xem.spell.run.getters.target.found xem.op"
# {value, distance:{value,min_distance,max_distance}, sort, selection, feature, ignore}

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
execute if data storage energy_manipulation:op target_in{value:"attacker"} run function energy_manipulation:spell/run/getters/target/selector/attacker
execute if score #xem.spell.run.getters.target.got_from_uuid xem.op matches 1 run return run scoreboard players get xem.spell.run.getters.target.found xem.op

#==<Init Target Data>==#
# set target storage
data modify storage energy_manipulation:op target set value {feature:"none",sort:"arbitrary"}
# get selector (value)
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op target_in.value
function energy_manipulation:spell/run/getters/target/selector with storage energy_manipulation:op macro_data
#set feature
data modify storage energy_manipulation:op target.feature set from storage energy_manipulation:op target_in.feature
#set sort
data modify storage energy_manipulation:op target.sort set from storage energy_manipulation:op target_in.sort
# selection
execute if data storage energy_manipulation:op target_in{selection:"single"} run data modify storage energy_manipulation:op target.selection set value ",limit=1"
execute if data storage energy_manipulation:op target_in{selection:"multiple"} run data modify storage energy_manipulation:op target.selection set value ""
execute store success score #xem.spell.run.getters.target.get.numeric_selection xem.op unless data storage energy_manipulation:op target.selection 
execute if score #xem.spell.run.getters.target.get.numeric_selection xem.op matches 1 run data remove storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.get.numeric_selection xem.op matches 1 run data modify storage energy_manipulation:op macro_data.selection set from storage energy_manipulation:op target_in.selection
execute if score #xem.spell.run.getters.target.get.numeric_selection xem.op matches 1 run function energy_manipulation:spell/run/getters/target/selection with storage energy_manipulation:op macro_data
#ignore
execute if data storage energy_manipulation:op target_in{ignore:"caster"} run function energy_manipulation:spell/run/getters/target/ignore/caster with storage energy_manipulation:op running_spell_data
#ignore_focus
execute store result score #xem.spell.run.getters.target.get.ignore_focus xem.op run data get storage energy_manipulation:op target_in.ignore_focus 

#sphere or square check
execute store success score #xem.spell.run.getters.target.cube_check xem.op if data storage energy_manipulation:op target_in{volume_check:"cube"}
execute unless score #xem.spell.run.getters.target.cube_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/volume_check/prepare_sphere
execute if score #xem.spell.run.getters.target.cube_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/volume_check/prepare_cube

#==<Get Target>==#
# get target
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
data modify storage energy_manipulation:op target merge from storage energy_manipulation:op macro_data
execute unless score #xem.spell.run.getters.target.cube_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/volume_check/find_sphere with storage energy_manipulation:op target
execute if score #xem.spell.run.getters.target.cube_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/volume_check/find_cube with storage energy_manipulation:op target


#==<Remove Ignore Tags>==#
execute if data storage energy_manipulation:op target_in{ignore:"caster"} run function energy_manipulation:spell/run/getters/target/ignore/caster_remove with storage energy_manipulation:op running_spell_data


# result
return run scoreboard players get xem.spell.run.getters.target.found xem.op

