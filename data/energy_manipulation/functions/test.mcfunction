tag @s add xem.spell.casting_fatigue.has_to_tick
scoreboard players set #xem.spell.book.casting_power xem.op 100
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:spell/run/new
