# <@>545ec994-ae69-485d-9604-981ce1612a99
# -> {initial_yawn, initial_pitch, position_x, position_y, position_z}

$execute in minecraft:overworld rotated $(initial_yawn) $(initial_pitch) facing ^$(position_x) ^$(position_y) ^$(position_z) run tp @s 0.0 0.0 0.0 ~ ~
data modify storage energy_manipulation:op direction_out set from entity @s Rotation

execute in minecraft:overworld run tp @s 29999999.0 0 12341232.0

# TODO i might be able to tp to store coord in the first tp command directly