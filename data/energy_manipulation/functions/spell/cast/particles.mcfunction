# particles
execute store result score #xem.spell.cast.energy_type xem.op run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.energy_type_id
execute if score #xem.spell.cast.energy_type xem.op matches 1 run function energy_manipulation:spell/cast/particles/sun
execute if score #xem.spell.cast.energy_type xem.op matches 2 run function energy_manipulation:spell/cast/particles/ground
execute if score #xem.spell.cast.energy_type xem.op matches 3 run function energy_manipulation:spell/cast/particles/soul
execute if score #xem.spell.cast.energy_type xem.op matches 4 run function energy_manipulation:spell/cast/particles/dark
execute if score #xem.spell.cast.energy_type xem.op matches 5 run function energy_manipulation:spell/cast/particles/void