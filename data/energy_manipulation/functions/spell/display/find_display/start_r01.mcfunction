# <@> Player
# result: aoe with tag "xem.spell.display.find_display.found"

tag @s add xem.spell.display.find_display.player
execute as @e[type=minecraft:area_effect_cloud,distance=..0.1,tag=xem.spell.display] run function energy_manipulation:spell/display/find_display/check_owner
tag @s remove xem.spell.display.find_display.player

