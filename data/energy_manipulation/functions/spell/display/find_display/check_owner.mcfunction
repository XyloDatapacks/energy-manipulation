# remove tag so only the right one has the tag
tag @s remove xem.spell.display.find_display.found

# check if has to give tag
scoreboard players set #xem.spell.display.find_display.has_owner xem.op 0
execute on origin if entity @s[tag=xem.spell.display.find_display.player] run scoreboard players set #xem.spell.display.find_display.has_owner xem.op 1
execute if score #xem.spell.display.find_display.has_owner xem.op matches 1 run tag @s add xem.spell.display.find_display.found

