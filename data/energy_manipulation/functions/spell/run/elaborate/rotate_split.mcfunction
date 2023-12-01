execute if score #xem.spell.run.elaborate.split_yawn xem.op matches 0 if score #xem.spell.run.elaborate.split_pitch xem.op matches 0 run return 0

# set rotation angle
data modify storage energy_manipulation:op direction_in set value {value:"rotated_view_plane",angle:{value:"yawn-pitch",angle_format:"delta"}}
execute store result storage energy_manipulation:op direction_in.angle.yawn float 0.01 run scoreboard players operation #xem.spell.run.elaborate.split_set_yawn xem.op += #xem.spell.run.elaborate.split_yawn xem.op 
execute store result storage energy_manipulation:op direction_in.angle.pitch float 0.01 run scoreboard players operation #xem.spell.run.elaborate.split_set_pitch xem.op += #xem.spell.run.elaborate.split_pitch xem.op
function energy_manipulation:spell/run/getters/direction/get
# save split rotation
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op direction_out
