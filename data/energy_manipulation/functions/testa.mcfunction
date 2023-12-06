summon minecraft:frog ~ ~1000 ~ {Tags:["test"],NoAI:1b,active_effects:[{duration:-1,id:"minecraft:invisibility",show_particles:0b}]}
summon minecraft:snowball ~ ~ ~ {Tags:["test"],NoGravity:1b}

ride @e[type=minecraft:frog,tag=test,limit=1] mount @e[type=minecraft:snowball,tag=test,limit=1]

tag @e remove test