# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

# get open books count
execute store result score @s xem.spell.book.open_books_count run clear @s minecraft:shield{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{opened:1b}} 0

# more then 1 book open -> close books
execute if score @s xem.spell.book.open_books_count matches 2.. run function energy_manipulation:spell/book/close_books/start
# 1 book open + not has_display -> close books
execute if score @s xem.spell.book.open_books_count matches 1 unless score @s xem.spell.display.has_display matches 1 run function energy_manipulation:spell/book/close_books/start
# no books open + has_display -> dispose interface
execute if score @s xem.spell.book.open_books_count matches 0 if score @s xem.spell.display.has_display matches 1 run function energy_manipulation:spell/book/close_books/start
