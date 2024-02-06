# <@> item_display

$summon minecraft:snowball ~ ~ ~ {Motion:[$(motion_x)d,$(motion_y)d,$(motion_z)d],Owner:$(hitbox_uuid),Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Silent:1b,NoGravity:1b,Tags:["smithed.entity","smithed.strict","xem.mind.meditation.mind_entity","xem.mind.meditation.mind_entity.new_proj"]}
ride @s mount @e[type=minecraft:snowball,distance=..0.01,limit=1,tag=xem.mind.meditation.mind_entity.new_proj]
execute on vehicle run tag @s remove xem.mind.meditation.mind_entity.new_proj
