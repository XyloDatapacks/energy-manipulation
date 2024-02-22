#<@> spell marker
# display -> spell marker

execute at @s run function energy_manipulation:spell/cost/fx_spell_cost_not_paid

execute on vehicle on passengers run kill @s[type=minecraft:item_display,tag=xem.spell.shape_display]
execute on vehicle run kill @s
kill @s