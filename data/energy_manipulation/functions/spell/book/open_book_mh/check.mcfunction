# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

execute if predicate energy_manipulation:spell/book/open_book run function energy_manipulation:spell/book/open_book_mh/start
