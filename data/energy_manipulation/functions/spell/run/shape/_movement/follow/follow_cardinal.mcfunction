# -> {target, anchor}

scoreboard players set #xem.spell.run._movement.follow.followed xem.op 0
tag @s add xem.spell.run._movement.follow.entity
$execute as $(target) at @s anchored $(anchor) positioned ^ ^ ^ positioned ~$(position_x) ~$(position_y) ~$(position_z) as @e[type=minecraft:item_display,distance=..1,tag=xem.spell.run._movement.follow.entity] store success score #xem.spell.run._movement.follow.followed xem.op run tp @s ~ ~ ~
$execute unless score #xem.spell.run._movement.follow.followed xem.op matches 1 as $(target) at @s anchored $(anchor) positioned ^ ^ ^ positioned ~$(position_x) ~$(position_y) ~$(position_z) as @e[type=minecraft:item_display,tag=xem.spell.run._movement.follow.entity] facing entity @s feet run tp @s ^ ^ ^-1
tag @s remove xem.spell.run._movement.follow.entity