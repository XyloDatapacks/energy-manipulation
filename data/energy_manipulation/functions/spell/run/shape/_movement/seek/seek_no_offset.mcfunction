# -> {target, anchor}


$execute at @s facing entity $(target) $(anchor) positioned ^ ^ ^-1 rotated $(yawn) $(pitch) positioned ^ ^ ^-7 facing entity @s feet on passengers run tp @s ~ ~ ~ ~ ~
$execute on passengers rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion {initial_speed:$(initial_speed)}
data modify entity @s Motion set from storage energy_manipulation:op temp_motion

execute on passengers rotated as @s on passengers run tp @s[tag=xem.spell.shape_marker] ~ ~ ~ ~ ~