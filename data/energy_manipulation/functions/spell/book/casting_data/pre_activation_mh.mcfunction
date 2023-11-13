execute store result score @s xem.spell.book.casting_book_slot run data get entity @s SelectedItemSlot
execute store result score @s xem.spell.book.casting_book_type run data get entity @s SelectedItem.tag.energy_manipulation.spell_book.energy_type_id
scoreboard players add @s xem.spell.book.casting_time 1
item modify entity @s weapon.mainhand energy_manipulation:spell/book/cast/pre_activation
scoreboard players remove @s xem.spell.book.casting_time 1

attribute @s minecraft:generic.attack_speed modifier add 1234-1-0-0-0 "minecraft:generic.attack_speed" -1000 add


scoreboard players reset @s xem.spell.book.dmg_blocked