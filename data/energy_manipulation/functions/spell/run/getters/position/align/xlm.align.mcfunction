# <@>545ec994-ae69-485d-9604-981ce1612a99
# -> {initial_position_xyz, align}
# out: "energy_manipulation:op position_out"

$execute in minecraft:overworld positioned 0.0 0.0 0.0 positioned ~$(initial_position_x) ~$(initial_position_y) ~$(initial_position_z) align $(align) run tp @s ~ ~ ~
data modify storage energy_manipulation:op position_out set from entity @s Pos
execute in minecraft:overworld run tp @s 29999999.0 0 12341232.0
