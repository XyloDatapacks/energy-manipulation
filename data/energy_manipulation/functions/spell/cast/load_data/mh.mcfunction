# load data
data remove storage energy_manipulation:op spell_book
data modify storage energy_manipulation:op spell_book set from entity @s SelectedItem
data modify storage energy_manipulation:op spell set value {}
data modify storage energy_manipulation:op spell set from storage energy_manipulation:op spell_book.tag.energy_manipulation.spell