execute store success score #xem.mind.meditation.exit.right_owner xem.op on origin if entity @s[tag=xem.mind.meditation.player]
execute unless score #xem.mind.meditation.exit.right_owner xem.op matches 1 run return 0

tp @a[tag=xem.mind.meditation.player,limit=1] @s
function energy_manipulation:mind/meditation/exit/kill
