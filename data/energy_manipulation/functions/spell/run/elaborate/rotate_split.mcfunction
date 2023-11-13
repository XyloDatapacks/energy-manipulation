data modify storage energy_manipulation:op instruction set value {value:"rotated",angle:{value:"yawn-pitch",angle_format:"delta"}}
data modify storage energy_manipulation:op instruction.angle.yawn set from storage energy_manipulation:op selected_concatenate.concatenate.yawn
data modify storage energy_manipulation:op instruction.angle.pitch set from storage energy_manipulation:op selected_concatenate.concatenate.pitch
function energy_manipulation:spell/run/elaborate/instruction/direction/start

# update for next split
data modify storage energy_manipulation:op running_spell_marker.Rotation set from storage energy_manipulation:op initial_rotation
