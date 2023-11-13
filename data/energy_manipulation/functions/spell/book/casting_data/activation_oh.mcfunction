scoreboard players set @s xem.spell.book.casting_book_slot -106
execute store result score @s xem.spell.book.casting_book_type run data get entity @s Inventory[{Slot:-106b}].tag.energy_manipulation.spell_book.energy_type_id
scoreboard players add @s xem.spell.book.casting_time 1
item modify entity @s weapon.offhand energy_manipulation:spell/book/cast/activation
scoreboard players remove @s xem.spell.book.casting_time 1




scoreboard players reset @s xem.spell.book.dmg_blocked