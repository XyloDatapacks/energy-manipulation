# get open books count
execute store result score @s xem.spell.book.open_books_count run clear @s minecraft:shield{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{opened:1b}} 0

# no books open + has_display -> dispose interface
execute if score @s xem.spell.book.open_books_count matches 0 if score @s xem.spell.display.has_display matches 1 run function energy_manipulation:spell/display/dispose_and_kill

# check if display is there
execute if score @s xem.spell.book.open_books_count matches 1 run function energy_manipulation:spell/display/check_from_player
