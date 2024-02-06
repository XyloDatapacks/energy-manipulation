execute at @s run function energy_manipulation:mind/meditation/fx/propel/start

data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.initial_speed double 1 run scoreboard players operation @s xem.mind.meditation.action.propel < #6 xconst
function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data
execute on vehicle on vehicle run data modify entity @s Motion set from storage energy_manipulation:op temp_motion

scoreboard players set @s xem.mind.meditation.action.propel 0
