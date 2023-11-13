# advancement reward function
advancement revoke @s only energy_manipulation:spell/book/moved_book
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


scoreboard players set @s xem.spell.book.move_book_running 1

# reset "casting" and "casting_stage" of all casting books not in use
execute store result score #xem.spell.book.casting_books_count xem.op run clear @s minecraft:shield{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{casting:1b}} 0
execute if score @s xem.spell.book.casting_time matches 1.. unless score @s xem.spell.cost.died matches 1.. run scoreboard players remove #xem.spell.book.casting_books_count xem.op 1
execute if score #xem.spell.book.casting_books_count xem.op matches 1.. store result storage energy_manipulation:op held_book_slot.slot byte 1 run scoreboard players get @s xem.spell.book.casting_book_slot
execute if score #xem.spell.book.casting_books_count xem.op matches 1.. run function energy_manipulation:spell/book/reset_books/start with storage energy_manipulation:op held_book_slot

scoreboard players set @s xem.spell.book.move_book_running 0