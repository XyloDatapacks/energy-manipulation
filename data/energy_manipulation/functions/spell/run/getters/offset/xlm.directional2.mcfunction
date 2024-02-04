# <@>545ec994-ae69-485d-9604-981ce1612a99

# in: "energy_manipulation:op offset_in"
# out: "energy_manipulation:op offset_out"

$execute in minecraft:overworld positioned 0.0 0.0 0.0 positioned ~$(initial_position_x) ~$(initial_position_y) ~$(initial_position_z) rotated $(initial_rotation_yawn) $(initial_rotation_pitch) run tp @s ^$(position_x) ^$(position_y) ^$(position_z)
data modify storage energy_manipulation:op offset_out set from entity @s Pos
execute in minecraft:overworld run tp @s 29999999.0 0 12341232.0
