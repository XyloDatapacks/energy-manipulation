# <@> marker

summon armor_stand ~ ~ ~ {NoGravity:1b}

tag @s add test3
execute on vehicle on passengers run kill @s[tag=!test3]
execute on vehicle on vehicle run kill @s
execute on vehicle run kill @s
kill @s