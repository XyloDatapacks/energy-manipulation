# -> {target, anchor}

#TODO: add offset
$execute at @s facing entity $(target) $(anchor) positioned ^ ^ ^-1 rotated $(yawn) $(pitch) positioned ^ ^ ^-7 facing entity @s feet on passengers on passengers if entity @s[tag=xem.spell.shape_marker] run tp @s ~ ~ ~ ~ ~
$execute on passengers on passengers if entity @s[tag=xem.spell.shape_marker] rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion {initial_speed:$(initial_speed)}
data modify entity @s Motion set from storage energy_manipulation:op temp_motion
