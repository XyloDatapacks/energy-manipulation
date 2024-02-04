# <@>545ec994-ae69-485d-9604-981ce1612a99

$execute in minecraft:overworld positioned 0.0 0.0 0.0 run tp @s ~$(initial_position_x) ~$(initial_position_y) ~$(initial_position_z) facing ~$(position_x) ~$(position_y) ~$(position_z)
data modify storage energy_manipulation:op direction_out set from entity @s Rotation
execute in minecraft:overworld run tp @s 29999999.0 0 12341232.0

