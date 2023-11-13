# init score
scoreboard players set @s xem.spell.display.showing_value -1

# load data
function energy_manipulation:spell/book/load_data/mh
# get index to show
execute store result score @s xem.spell.display.index_input run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.show_index

# init
execute unless data storage energy_manipulation:op spell_build[0] run function energy_manipulation:spell/book/init
# execute if score #xem.spell.build.modified_storage xem.op matches 1 run tellraw @a[tag=xem.debug] "init done"

# show display (show first cause i cant open a book without has_display, else it will close)
function energy_manipulation:spell/display/content/show/current

# open book
execute store result score #xem.spell.book.open_book.open_book_type xem.op run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.energy_type_id
item modify entity @s weapon.mainhand energy_manipulation:spell/book/open_book

# sound
playsound energy_manipulation:spell.book.open player @a ~ ~ ~