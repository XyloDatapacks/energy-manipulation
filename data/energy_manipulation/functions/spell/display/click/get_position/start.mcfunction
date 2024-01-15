# <@> Player
# must run energy_manipulation:spell/display/find_display/start first
# returns position value

# find click pos based on angle offset 
scoreboard players set xem.spell.display.click.get_position.result xem.op -1
execute at @s rotated ~ 0 positioned ^ ^ ^-1 rotated as @e[type=minecraft:area_effect_cloud,distance=..3,tag=xem.spell.display.find_display.found,limit=1] rotated ~ 0 positioned ^ ^ ^1 rotated as @s rotated ~ 0 store result score xem.spell.display.click.get_position.result xem.op run function energy_manipulation:spell/display/click/get_position/find

# position clicked
execute if score xem.spell.display.click.get_position.result xem.op matches -1 run return -1
execute if score xem.spell.display.click.get_position.result xem.op matches 0 run return 0
execute if score xem.spell.display.click.get_position.result xem.op matches 1 run return 1
execute if score xem.spell.display.click.get_position.result xem.op matches 2 run return 2
execute if score xem.spell.display.click.get_position.result xem.op matches 3 run return 3
execute if score xem.spell.display.click.get_position.result xem.op matches 4 run return 4
