# -> {target, anchor}

$execute as $(target) at @s anchored $(anchor) positioned ^ ^ ^ as $(uuid) facing entity @s feet positioned as @s positioned ^ ^ ^1 rotated $(yawn) $(pitch) positioned ^ ^ ^-7 facing entity @s feet on passengers positioned as @s run tp @s ~ ~ ~ ~ ~
$execute on passengers rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion {initial_speed:$(initial_speed)}
data modify entity @s Motion set from storage energy_manipulation:op temp_motion

execute on passengers at @s on passengers positioned as @s run tp @s[tag=xem.spell.shape_marker] ~ ~ ~ ~ ~
