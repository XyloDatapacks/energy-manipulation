tag @s remove xem.meditation.entity_new
execute on passengers run data modify entity @s Owner set from storage energy_manipulation:op temp_uuid

item replace entity @s armor.head from entity @a[tag=xem.meditation.player,limit=1] armor.head
item replace entity @s armor.chest from entity @a[tag=xem.meditation.player,limit=1] armor.chest
item replace entity @s armor.legs from entity @a[tag=xem.meditation.player,limit=1] armor.legs
item replace entity @s armor.feet from entity @a[tag=xem.meditation.player,limit=1] armor.feet
item replace entity @s weapon.mainhand from entity @a[tag=xem.meditation.player,limit=1] weapon.mainhand
item replace entity @s weapon.offhand from entity @a[tag=xem.meditation.player,limit=1] weapon.offhand

