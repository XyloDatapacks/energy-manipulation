# in: "energy_manipulation:op offset_in"
# out: "energy_manipulation:op offset_out"

execute store result score xem.spell.run.getters.offset.x xem.op run data get storage energy_manipulation:op initial_position[0] 1000
execute store result score xem.spell.run.getters.offset.y xem.op run data get storage energy_manipulation:op initial_position[1] 1000
execute store result score xem.spell.run.getters.offset.z xem.op run data get storage energy_manipulation:op initial_position[2] 1000

execute store result score xem.spell.run.getters.offset.x_in xem.op run data get storage energy_manipulation:op offset_in.x 1000
execute store result score xem.spell.run.getters.offset.y_in xem.op run data get storage energy_manipulation:op offset_in.y 1000
execute store result score xem.spell.run.getters.offset.z_in xem.op run data get storage energy_manipulation:op offset_in.z 1000

data modify storage energy_manipulation:op offset_out set value [0.0d,0.0d,0.0d]
execute store result storage energy_manipulation:op offset_out[0] double 0.001 run scoreboard players operation xem.spell.run.getters.offset.x xem.op += xem.spell.run.getters.offset.x_in xem.op
execute store result storage energy_manipulation:op offset_out[1] double 0.001 run scoreboard players operation xem.spell.run.getters.offset.y xem.op += xem.spell.run.getters.offset.y_in xem.op
execute store result storage energy_manipulation:op offset_out[2] double 0.001 run scoreboard players operation xem.spell.run.getters.offset.z xem.op += xem.spell.run.getters.offset.z_in xem.op

