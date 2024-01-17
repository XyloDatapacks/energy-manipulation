spectate
ride @s dismount
tp @s 5 -56 0

kill @e[tag=test1]
kill @e[tag=test2]

setblock 0 0 0 stone
summon horse 0 1 0 {Tags:["test1"],Silent:1b,NoAI:1b,Tame:1b,Age:-1000000,DeathLootTable:"xylo_library:empty",Attributes:[{Name:horse.jump_strength,Base:0.1}],SaddleItem:{id:"minecraft:saddle",Count:1b},ArmorItem:{}}
summon marker 0 1 0 {Tags:["test1"]}
execute at @s run summon snowball ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Tags:["test2"],NoGravity:1b,Passengers:[{id:"minecraft:item_display",Tags:["test2"],teleport_duration:1}]}

gamemode spectator @s
spectate @e[type=minecraft:item_display,limit=1,sort=nearest,tag=test2]
ride @s mount @e[type=minecraft:horse,limit=1,sort=nearest,tag=test1]