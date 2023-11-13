# set energy_manipulation:op spell_book.Slot

execute store result score #xem.spell.book.update_book.update_book_slot xem.op store result storage energy_manipulation:op update_book_slot.Slot int 1 run data get storage energy_manipulation:op spell_book.Slot
execute if score #xem.spell.book.update_book.update_book_slot xem.op matches 0..8 run function energy_manipulation:spell/book/update_book/update_hotbar with storage energy_manipulation:op update_book_slot
execute if score #xem.spell.book.update_book.update_book_slot xem.op matches 9.. run function energy_manipulation:spell/book/update_book/update_inv_1
execute if score #xem.spell.book.update_book.update_book_slot xem.op matches -106 run item modify entity @s weapon.offhand energy_manipulation:spell/book/update_data