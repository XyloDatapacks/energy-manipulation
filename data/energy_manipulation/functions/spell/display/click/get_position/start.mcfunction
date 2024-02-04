# <@> Player
# must run energy_manipulation:spell/display/find_display/start first
# returns position index

# find click pos based on angle offset 
execute at @s rotated ~ 0 positioned ^ ^ ^-1 rotated as @e[type=minecraft:area_effect_cloud,distance=..3,tag=xem.spell.display.find_display.found,limit=1] rotated ~ 0 positioned ^ ^ ^1 rotated as @s rotated ~ 0 run return run function energy_manipulation:spell/display/click/get_position/find
