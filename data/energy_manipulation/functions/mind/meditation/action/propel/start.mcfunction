execute at @s run function energy_manipulation:mind/meditation/fx/propel/start

# motion = min(propel,10)*strength/10  |  [0,strength]
data remove storage energy_manipulation:op macro_data
scoreboard players operation @s xem.mind.meditation.action.propel < #10 xconst
execute store result storage energy_manipulation:op macro_data.initial_speed double 0.1 run scoreboard players operation @s xem.mind.meditation.action.propel *= #xem.mind.meditation.propel.strength xem.const
function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data
execute on vehicle on vehicle run data modify entity @s Motion set from storage energy_manipulation:op temp_motion

scoreboard players set @s xem.mind.meditation.action.propel 0
