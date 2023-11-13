execute store result score #xem.spell.book.reset_books.casting_book_type xem.op run data get storage energy_manipulation:op casting_books[-1].tag.energy_manipulation.spell_book.energy_type_id
execute store result score #xem.spell.book.reset_books.casting_book_slot xem.op store result storage energy_manipulation:op reset_book_slot.Slot int 1 run data get storage energy_manipulation:op casting_books[-1].Slot
execute if score #xem.spell.book.reset_books.casting_book_slot xem.op matches 0..8 run function energy_manipulation:spell/book/reset_books/reset_hotbar with storage energy_manipulation:op reset_book_slot
execute if score #xem.spell.book.reset_books.casting_book_slot xem.op matches 9.. run function energy_manipulation:spell/book/reset_books/reset_inv_1
execute if score #xem.spell.book.reset_books.casting_book_slot xem.op matches -106 run item modify entity @s weapon.offhand energy_manipulation:spell/book/reset_book

data remove storage energy_manipulation:op casting_books[-1]
scoreboard players remove #xem.spell.book.reset_books.casting_books_count xem.op 1
execute if score #xem.spell.book.reset_books.casting_books_count xem.op matches 1.. run function energy_manipulation:spell/book/reset_books/loop