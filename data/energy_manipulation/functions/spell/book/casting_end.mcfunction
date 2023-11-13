attribute @s minecraft:generic.attack_speed modifier remove 1234-1-0-0-0

# casting power
scoreboard players operation #xem.spell.book.casting_power xem.op = @s xem.spell.book.casting_time
scoreboard players remove #xem.spell.book.casting_power xem.op 10
scoreboard players operation #xem.spell.book.casting_power xem.op *= #100 xconst
scoreboard players operation #xem.spell.book.casting_power xem.op /= #30 xconst
scoreboard players operation #xem.spell.book.casting_power xem.op < #200 xconst

# tellraw @a[tag=xem.debug] {"score":{"objective":"xem.op","name":"#xem.spell.book.casting_power"}}

# spell casting
execute if entity @s[scores={xem.spell.book.casting_time=10..,xem.spell.book.casting_book_slot=0..},predicate=energy_manipulation:spell/cast_mh] at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:spell/cast/cast_mh
execute if entity @s[scores={xem.spell.book.casting_time=10..,xem.spell.book.casting_book_slot=-106},predicate=energy_manipulation:spell/cast_oh] at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:spell/cast/cast_oh

scoreboard players set @s xem.spell.book.casting_time 0
function energy_manipulation:spell/book/moved_book
