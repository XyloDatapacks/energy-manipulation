summon snowball ~ ~ ~ {Motion:[1.0d,0.2d,0.0d],Tags:["test1"]}
summon frog ~ ~1000 ~ {active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:1b}],Tags:["test1"]}
ride @e[type=frog,tag=test1,limit=1] mount @e[type=snowball,tag=test1,limit=1]
tag @e remove test1

