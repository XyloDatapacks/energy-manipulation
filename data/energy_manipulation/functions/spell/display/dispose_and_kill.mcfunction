# find display stack
function energy_manipulation:spell/display/find_display/start
# kill
execute at @s as @e[type=minecraft:area_effect_cloud,distance=..10,tag=xem.spell.display.find_display.found,limit=1] run function energy_manipulation:spell/display/kill

# dispose
function energy_manipulation:spell/display/dispose