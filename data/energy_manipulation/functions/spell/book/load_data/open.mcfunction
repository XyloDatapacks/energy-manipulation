# load data
scoreboard players set #xem.spell.build.modified_storage xem.op 0
data remove storage energy_manipulation:op spell_build
data remove storage energy_manipulation:op spell_book
data modify storage energy_manipulation:op spell_book set from entity @s Inventory[{tag:{xylo:{id_tags:["energy_manipulation:spell_book"]},energy_manipulation:{opened:1b}}}]
data modify storage energy_manipulation:op spell_build set from storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_build
