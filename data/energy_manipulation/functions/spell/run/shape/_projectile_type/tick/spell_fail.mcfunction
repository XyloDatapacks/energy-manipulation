# <@> display entity
#proj -> display -> spell_marker , correction marker

function energy_manipulation:spell/cost/fx_spell_cost_not_paid

execute on vehicle run kill @s
execute on passengers run kill @s
kill @s
