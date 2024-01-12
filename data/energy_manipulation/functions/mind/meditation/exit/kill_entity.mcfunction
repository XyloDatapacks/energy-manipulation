execute store success score #xem.meditation.exit.right_owner xem.op on origin if entity @s[tag=xem.meditation.player]
execute unless score #xem.meditation.exit.right_owner xem.op matches 1 run return 0

tp @a[tag=xem.meditation.player,limit=1] @s
execute on passengers on passengers run kill @s
execute on passengers run kill @s
kill @s
