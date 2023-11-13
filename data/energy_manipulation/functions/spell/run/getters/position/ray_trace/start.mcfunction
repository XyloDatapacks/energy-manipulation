# in: "energy_manipulation:op position_in"

# get position
data remove storage energy_manipulation:op macro_data
function energy_manipulation:spell/run/getters/macro_input/initial_position
function energy_manipulation:spell/run/getters/macro_input/initial_rotation
data modify storage energy_manipulation:op macro_data.dimension set from storage energy_manipulation:op running_spell_data.dimension
execute store result score #xem.spell.run.getters.position.ray_trace.loop xem.op run data get storage energy_manipulation:op position_in.max_distance 10

execute store result score #xem.spell.run.getters.position.ray_trace.blocks xem.op store result score #xem.spell.run.getters.position.ray_trace.entities xem.op if data storage energy_manipulation:op position_in{blocking_hits:block_and_entities}
execute if data storage energy_manipulation:op position_in{blocking_hits:blocks} run scoreboard players set #xem.spell.run.getters.position.ray_trace.blocks xem.op 1
execute if data storage energy_manipulation:op position_in{blocking_hits:entities} run scoreboard players set #xem.spell.run.getters.position.ray_trace.entities xem.op 1

function energy_manipulation:spell/run/getters/position/ray_trace/start_loop with storage energy_manipulation:op macro_data

