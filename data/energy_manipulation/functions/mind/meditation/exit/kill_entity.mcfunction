execute store success score #xem.mind.meditation.exit.right_owner xem.op on origin if entity @s[tag=xem.mind.meditation.player]
execute unless score #xem.mind.meditation.exit.right_owner xem.op matches 1 run return 0

execute at @s run tp @a[tag=xem.mind.meditation.player,limit=1] ~ ~0.55 ~
function energy_manipulation:mind/meditation/exit/kill

scoreboard players set #xem.mind.meditation.exit.found_body xem.op 1