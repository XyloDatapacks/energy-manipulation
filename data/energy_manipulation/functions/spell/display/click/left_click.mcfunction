# advancement reward function
advancement revoke @s only energy_manipulation:spell/display/click/left_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


# load data
function energy_manipulation:spell/book/load_data/open

# find display stack
function energy_manipulation:spell/display/find_display/start
# find click pos 
execute store result score xem.spell.display.click.position xem.op run function energy_manipulation:spell/display/click/get_position/start
# actions
execute if score xem.spell.display.click.position xem.op matches 0 run function energy_manipulation:spell/display/content/show/first 
execute if score xem.spell.display.click.position xem.op matches 1 run function energy_manipulation:spell/display/content/show/previous_concatenate 
execute if score xem.spell.display.click.position xem.op matches 3 run function energy_manipulation:spell/display/content/show/next_concatenate
execute if score xem.spell.display.click.position xem.op matches 4 run function energy_manipulation:spell/display/content/show/last 

# remove interface
execute if score xem.spell.display.click.position xem.op matches 2 run function energy_manipulation:spell/book/close_books/start


# execute if score #xem.spell.build.modified_storage xem.op matches 1 run tellraw @a[tag=xem.debug] "modified node"
execute if score xem.spell.display.click.position xem.op matches 0..4 run function energy_manipulation:spell/book/update_book/start