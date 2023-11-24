tp @s ~ ~ ~ ~ ~

data remove storage energy_manipulation:op temp_rotation_macro
data modify storage energy_manipulation:op temp_rotation_macro.yawn set from entity @s Rotation[0]

kill @s