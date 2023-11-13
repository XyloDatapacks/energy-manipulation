# in: "energy_manipulation:op angle_in"
# out: "energy_manipulation:op angle_out"

execute store result score xem.spell.run.getters.angle.yawn xem.op run data get storage energy_manipulation:op initial_rotation[0] 1000
execute store result score xem.spell.run.getters.angle.pitch xem.op run data get storage energy_manipulation:op initial_rotation[1] 1000

execute store result score xem.spell.run.getters.angle.yawn_in xem.op run data get storage energy_manipulation:op angle_in.yawn 1000
execute store result score xem.spell.run.getters.angle.pitch_in xem.op run data get storage energy_manipulation:op angle_in.pitch 1000

data modify storage energy_manipulation:op angle_out set value [0.0f,0.0f]
execute store result storage energy_manipulation:op angle_out[0] float 0.001 run scoreboard players operation xem.spell.run.getters.angle.yawn xem.op += xem.spell.run.getters.angle.yawn_in xem.op
execute store result storage energy_manipulation:op angle_out[1] float 0.001 run scoreboard players operation xem.spell.run.getters.angle.pitch xem.op += xem.spell.run.getters.angle.pitch_in xem.op


