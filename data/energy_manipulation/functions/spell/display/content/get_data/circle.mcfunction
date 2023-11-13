# circle color
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 1 run data modify storage energy_manipulation:op spell_display_data.circle_cmd set from storage energy_manipulation:spell spell_book.sun.circle.overcharging
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 2 run data modify storage energy_manipulation:op spell_display_data.circle_cmd set from storage energy_manipulation:spell spell_book.ground.circle.overcharging
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 3 run data modify storage energy_manipulation:op spell_display_data.circle_cmd set from storage energy_manipulation:spell spell_book.soul.circle.overcharging
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 4 run data modify storage energy_manipulation:op spell_display_data.circle_cmd set from storage energy_manipulation:spell spell_book.dark.circle.overcharging
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 5 run data modify storage energy_manipulation:op spell_display_data.circle_cmd set from storage energy_manipulation:spell spell_book.void.circle.overcharging

# circle offset
execute if predicate xylo_library:is_sneaking run data modify storage energy_manipulation:op spell_display_data.circle_offset set value 1.25
execute at @s anchored eyes positioned ^ ^ ^ if entity @s[distance=..0.6] run data modify storage energy_manipulation:op spell_display_data.circle_offset set value 0.36
execute if predicate xylo_library:riding on vehicle store result score #xem.spell.display.content.get_data.riding_offset xem.op run data get entity @s Pos[1] 1000
execute if predicate xylo_library:riding at @s anchored eyes positioned ^ ^ ^ summon minecraft:marker run function energy_manipulation:spell/display/content/get_data/adjust_offset
