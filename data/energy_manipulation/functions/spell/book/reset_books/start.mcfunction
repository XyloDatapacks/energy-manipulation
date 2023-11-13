# reset casting and casting_stage of books

data modify storage energy_manipulation:op casting_books set value []
data modify storage energy_manipulation:op casting_books append from entity @s Inventory[{tag:{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{casting:1b}}}]
$execute if score @s xem.spell.book.casting_time matches 1.. unless score @s xem.spell.cost.died matches 1.. run data remove storage energy_manipulation:op casting_books[{Slot:$(slot)b}]

execute store result score #xem.spell.book.reset_books.casting_books_count xem.op run data get storage energy_manipulation:op casting_books
execute if score #xem.spell.book.reset_books.casting_books_count xem.op matches 1.. run function energy_manipulation:spell/book/reset_books/loop
