# remove effects incompatible with that shape
$data remove storage energy_manipulation:op spell_display[{incompatible_shapes:["$(value)"]}]

execute unless entity @s[advancements={energy_manipulation:tutorial/spell/book/craft/sun=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"sun"}]
execute unless entity @s[advancements={energy_manipulation:tutorial/spell/book/craft/ground=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"ground"}]
execute unless entity @s[advancements={energy_manipulation:tutorial/spell/book/craft/soul=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"soul"}]
execute unless entity @s[advancements={energy_manipulation:tutorial/spell/book/craft/dark=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"dark"}]
execute unless entity @s[advancements={energy_manipulation:tutorial/spell/book/craft/void=true}] run data remove storage energy_manipulation:op spell_display[{energy_type:"void"}]