execute store success score #xem.mind.meditation.exit.right_owner xem.op on origin if entity @s[tag=xem.mind.meditation.player]
execute unless score #xem.mind.meditation.exit.right_owner xem.op matches 1 run return 0

execute at @s run tp @a[tag=xem.mind.meditation.player,limit=1] ~ ~0.55 ~ ~ ~
execute on passengers if entity @s[type=minecraft:marker,tag=xem.mind.meditation.entity] run function xylo_library:internal/clone/dispose/kill_from_marker/start

scoreboard players set #xem.mind.meditation.exit.found_body xem.op 1
