#<@> spell marker
# display -> spell marker

execute on vehicle on passengers run kill @s[type=minecraft:item_display,tag=xem.spell.shape_display]
execute on vehicle run kill @s

# run elaborate
function energy_manipulation:spell/run/elaborate/start 