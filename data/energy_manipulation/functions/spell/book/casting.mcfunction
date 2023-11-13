# advancement reward function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

execute if entity @s[advancements={energy_manipulation:spell/book/casting={use_new=true}}] run scoreboard players set @s xem.spell.book.casting_time 0

# book changes
execute unless score @s xem.spell.book.casting_time matches 1.. if predicate energy_manipulation:spell/book/cast/casting_oh run function energy_manipulation:spell/book/casting_data/activation_oh
execute unless score @s xem.spell.book.casting_time matches 1.. if predicate energy_manipulation:spell/book/cast/casting_mh run function energy_manipulation:spell/book/casting_data/pre_activation_mh
execute if score @s xem.spell.book.casting_time matches 5 if score @s xem.spell.book.casting_book_slot matches 0.. run function energy_manipulation:spell/book/casting_data/activation_mh

# sound
execute if score @s xem.spell.book.casting_time matches 5 run execute at @s run playsound energy_manipulation:spell.prepare_cast player @a ~ ~ ~ 3.0 1

# manage casting
scoreboard players add @s xem.spell.book.casting_time 1

execute if score @s xem.spell.book.casting_time matches 10 run function energy_manipulation:spell/book/casting_data/charging
execute if score @s xem.spell.book.casting_time matches 25 run function energy_manipulation:spell/book/casting_data/overcharging

scoreboard players operation #xem.spell.book.casting_data.withering_timer xem.op = @s xem.spell.book.casting_time
scoreboard players operation #xem.spell.book.casting_data.withering_timer xem.op %= #10 xconst
execute if score @s xem.spell.book.casting_time matches 40.. if score #xem.spell.book.casting_data.withering_timer xem.op matches 0 run function energy_manipulation:spell/book/casting_data/withering

#blocked
execute if score @s xem.spell.book.dmg_blocked matches 1.. run function energy_manipulation:spell/book/casting_data/blocked

