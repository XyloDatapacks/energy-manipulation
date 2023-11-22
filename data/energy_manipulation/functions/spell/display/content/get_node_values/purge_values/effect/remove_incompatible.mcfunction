# remove effects incompatible with that shape
$data remove storage energy_manipulation:op spell_display[{incompatible_shapes:["$(value)"]}]

execute unless entity @s[advancements={energy_manipulation:spell/display/content/get_node_values/effect/sun=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"sun"}]
execute unless entity @s[advancements={energy_manipulation:spell/display/content/get_node_values/effect/ground=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"ground"}]
execute unless entity @s[advancements={energy_manipulation:spell/display/content/get_node_values/effect/soul=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"soul"}]
execute unless entity @s[advancements={energy_manipulation:spell/display/content/get_node_values/effect/dark=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"dark"}]
execute unless entity @s[advancements={energy_manipulation:spell/display/content/get_node_values/effect/void=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"void"}]

