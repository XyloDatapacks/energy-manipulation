#<@> spell marker
# display -> spell marker

execute on vehicle on passengers run kill @s[type=minecraft:item_display,tag=xem.spell.shape_display]
execute on vehicle run kill @s

# run elaborate
tag @s remove xem.spell.inactive
tag @s remove xem.spell.shape_marker
tag @s remove xem.spell.aoe_type
function energy_manipulation:spell/run/elaborate/start 