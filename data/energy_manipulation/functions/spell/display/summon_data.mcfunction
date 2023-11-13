tag @s remove xem.spell.display_new

# set base entity owner
data modify entity @s Owner set from storage energy_manipulation:op spell_owner
# rotate UI
execute positioned as @s run tp @s ~ ~ ~ facing ^ ^ ^1

execute on passengers if entity @s[tag=xem.spell.display.0] positioned as @s run tp @s ~ ~ ~ ~-45 ~
execute on passengers if entity @s[tag=xem.spell.display.0] on passengers positioned as @s run tp @s ~ ~ ~ ~-45 ~

execute on passengers if entity @s[tag=xem.spell.display.1] positioned as @s run tp @s ~ ~ ~ ~-22.5 ~
execute on passengers if entity @s[tag=xem.spell.display.1] on passengers positioned as @s run tp @s ~ ~ ~ ~-22.5 ~

execute on passengers if entity @s[tag=xem.spell.display.2] positioned as @s run tp @s ~ ~ ~ ~ ~
execute on passengers if entity @s[tag=xem.spell.display.2] on passengers positioned as @s run tp @s ~ ~ ~ ~ ~

execute on passengers if entity @s[tag=xem.spell.display.3] positioned as @s run tp @s ~ ~ ~ ~22.5 ~
execute on passengers if entity @s[tag=xem.spell.display.3] on passengers positioned as @s run tp @s ~ ~ ~ ~22.5 ~

execute on passengers if entity @s[tag=xem.spell.display.4] positioned as @s run tp @s ~ ~ ~ ~45 ~
execute on passengers if entity @s[tag=xem.spell.display.4] on passengers positioned as @s run tp @s ~ ~ ~ ~45 ~

execute on passengers if entity @s[tag=xem.spell.display.info] positioned as @s run tp @s ~ ~ ~ ~ ~
execute on passengers if entity @s[tag=xem.spell.display.info] on passengers positioned as @s run tp @s ~ ~ ~ ~ ~

# set "@s xem.spell.display.node_index_input" from center node value_index
execute on origin unless score @s xem.spell.display.showing_value matches 1 run scoreboard players operation @s xem.spell.display.node_index_input = #xem.spell.display.node_index_input xem.op

