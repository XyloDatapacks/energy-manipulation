execute store success score #xem.meditation.exit.right_owner xem.op on origin if entity @s[tag=xem.meditation.player]

execute if score #xem.meditation.exit.right_owner xem.op matches 1 on vehicle run tp @a[tag=xem.meditation.player,limit=1] @s
execute if score #xem.meditation.exit.right_owner xem.op matches 1 on passengers run kill @s
execute if score #xem.meditation.exit.right_owner xem.op matches 1 on vehicle run kill @s
execute if score #xem.meditation.exit.right_owner xem.op matches 1 run kill @s