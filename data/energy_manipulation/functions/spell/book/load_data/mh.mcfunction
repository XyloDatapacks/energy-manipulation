# load data
scoreboard players set #xem.spell.build.modified_storage xem.op 0
data remove storage energy_manipulation:op spell_build
data remove storage energy_manipulation:op spell_book
data modify storage energy_manipulation:op spell_book set from entity @s SelectedItem
data modify storage energy_manipulation:op spell_build set from storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_build

execute store result score @s xem.spell.book.open_book_max_concatenates run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.max_concatenates
execute store result score @s xem.spell.book.open_book_max_instructions run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.max_instructions

