# <@>545ec994-ae69-485d-9604-981ce1612a99

tp @s ~ ~ ~
data modify storage energy_manipulation:op temp_motion set from entity @s Pos
tp @s 29999999.0 0 12341232.0
data modify storage energy_manipulation:op macro_data.motion_x set from storage energy_manipulation:op temp_motion[0]
data modify storage energy_manipulation:op macro_data.motion_y set from storage energy_manipulation:op temp_motion[1]
data modify storage energy_manipulation:op macro_data.motion_z set from storage energy_manipulation:op temp_motion[2]
