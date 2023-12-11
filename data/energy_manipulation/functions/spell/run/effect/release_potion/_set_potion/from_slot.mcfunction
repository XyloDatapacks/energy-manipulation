$execute if data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0] run item modify entity @s $(pre).$(post) energy_manipulation:spell/run/effect/release_potion/update_potion
$execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0] run item replace entity @s $(pre).$(post) with minecraft:glass_bottle
