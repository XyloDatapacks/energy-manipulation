tag @s remove xem.mind.meditation.entity_new
# aoe origin
execute on vehicle run tp @s ~ ~ ~ ~ ~
execute on vehicle run data modify entity @s Owner set from storage energy_manipulation:op temp_uuid
# marker hex uuid
data modify storage gu:main in set from storage energy_manipulation:op temp_uuid
function xylo_library:utilities/uuid/generate_from_storage
execute on vehicle on passengers if entity @s[type=minecraft:marker] run data modify entity @s data.energy_manipulation.meditation.owner_uuid set from storage gu:main out

# armor
item replace entity @s armor.head from entity @a[tag=xem.mind.meditation.player,limit=1] armor.head
item replace entity @s armor.chest from entity @a[tag=xem.mind.meditation.player,limit=1] armor.chest
item replace entity @s armor.legs from entity @a[tag=xem.mind.meditation.player,limit=1] armor.legs
item replace entity @s armor.feet from entity @a[tag=xem.mind.meditation.player,limit=1] armor.feet
item replace entity @s weapon.mainhand from entity @a[tag=xem.mind.meditation.player,limit=1] weapon.mainhand
item replace entity @s weapon.offhand from entity @a[tag=xem.mind.meditation.player,limit=1] weapon.offhand

# body life time
scoreboard players operation #xem.mind.meditation.end_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.mind.meditation.end_time xem.op += #xem.mind.meditation.duration xem.op 
execute on vehicle on passengers if entity @s[type=minecraft:marker] run scoreboard players operation @s xem.mind.meditation.end_time = #xem.mind.meditation.end_time xem.op
# start detecting player nearby condition
scoreboard players operation #xem.mind.meditation.return_in_body xem.op = #xlib.time xlib.op
scoreboard players operation #xem.mind.meditation.return_in_body xem.op += #xem.mind.meditation.refractory_time xem.op 
execute on vehicle run scoreboard players operation @s xem.mind.meditation.end_time = #xem.mind.meditation.return_in_body xem.op
