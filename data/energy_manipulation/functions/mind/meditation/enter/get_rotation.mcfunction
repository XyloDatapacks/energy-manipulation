tp @s ~ ~ ~ ~ ~

data modify storage energy_manipulation:op macro_data.yawn set from entity @s Rotation[0]
data modify storage energy_manipulation:op macro_data.pitch set from entity @s Rotation[1]

kill @s