function energy_manipulation:spell/display/dispose_and_kill

# close books
data modify storage energy_manipulation:op open_books set value []
data modify storage energy_manipulation:op open_books append from entity @s Inventory[{tag:{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{opened:1b}}}]
execute store result score #xem.spell.book.close_books.open_books_count xem.op run data get storage energy_manipulation:op open_books
execute if score #xem.spell.book.close_books.open_books_count xem.op matches 1.. run function energy_manipulation:spell/book/close_books/loop

# sound
playsound energy_manipulation:spell.book.close player @a ~ ~ ~

