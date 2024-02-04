# in: "energy_manipulation:op direction_in"

data modify storage energy_manipulation:op target_in set from storage energy_manipulation:op direction_in.target
data modify storage energy_manipulation:op target_in.selection set value "single"
execute unless function energy_manipulation:spell/run/getters/target/get run return 0

# get rotation from target
execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/direction/opposite_as/xlm.rotate with storage energy_manipulation:op target_out[0]
