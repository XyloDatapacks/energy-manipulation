# get input (energy_manipulation:op spell_display)
execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display set from storage energy_manipulation:op spell_build
execute if score @s xem.spell.display.showing_value matches 1 store result storage energy_manipulation:op get_selected_node_values.index int 1 run scoreboard players get @s xem.spell.display.index_input
execute if score @s xem.spell.display.showing_value matches 1 run function energy_manipulation:spell/display/content/get_node_values/get_values with storage energy_manipulation:op get_selected_node_values

# correct input (on player's scoreboard. cause the value has to be always valid after this function)
scoreboard players operation @s xem.spell.display.index_input > #0 xconst
scoreboard players operation @s xem.spell.display.node_index_input > #0 xconst
execute store result score #xem.spell.display.max_index_input xem.op run data get storage energy_manipulation:op spell_display
scoreboard players remove #xem.spell.display.max_index_input xem.op 1
execute unless score @s xem.spell.display.showing_value matches 1 run scoreboard players operation @s xem.spell.display.index_input < #xem.spell.display.max_index_input xem.op
execute if score @s xem.spell.display.showing_value matches 1 run scoreboard players operation @s xem.spell.display.node_index_input < #xem.spell.display.max_index_input xem.op

# prev/next concatenate
execute if score #xem.spell.display.content.show.concat xem.op matches 1 run function energy_manipulation:spell/display/content/get_concatenate/next
execute if score #xem.spell.display.content.show.concat xem.op matches -1 run function energy_manipulation:spell/display/content/get_concatenate/prev
scoreboard players set #xem.spell.display.content.show.concat xem.op 0

# get index to show
execute unless score @s xem.spell.display.showing_value matches 1 run scoreboard players operation #xem.spell.display.index xem.op = @s xem.spell.display.index_input
execute if score @s xem.spell.display.showing_value matches 1 run scoreboard players operation #xem.spell.display.index xem.op = @s xem.spell.display.node_index_input
scoreboard players remove #xem.spell.display.index xem.op 2

# set indexes
data remove storage energy_manipulation:op spell_display_index

scoreboard players operation #xem.spell.display.index xem.op > #-2 xconst
execute if score #xem.spell.display.index xem.op matches ..-1 run data modify storage energy_manipulation:op spell_display_index.0 set value 10000000
execute unless score #xem.spell.display.index xem.op matches ..-1 store result storage energy_manipulation:op spell_display_index.0 int 1 run scoreboard players get #xem.spell.display.index xem.op

scoreboard players add #xem.spell.display.index xem.op 1
execute if score #xem.spell.display.index xem.op matches ..-1 run data modify storage energy_manipulation:op spell_display_index.1 set value 10000000
execute unless score #xem.spell.display.index xem.op matches ..-1 store result storage energy_manipulation:op spell_display_index.1 int 1 run scoreboard players get #xem.spell.display.index xem.op

execute store result storage energy_manipulation:op spell_display_index.2 int 1 run scoreboard players add #xem.spell.display.index xem.op 1
execute store result storage energy_manipulation:op spell_display_index.3 int 1 run scoreboard players add #xem.spell.display.index xem.op 1
execute store result storage energy_manipulation:op spell_display_index.4 int 1 run scoreboard players add #xem.spell.display.index xem.op 1

# get data from indexes
function energy_manipulation:spell/display/content/get_data/set with storage energy_manipulation:op spell_display_index
data modify storage energy_manipulation:op spell_display_data merge from storage energy_manipulation:op spell_display_index

# generate UI
data modify storage energy_manipulation:op spell_owner set from entity @s UUID
execute if score @s xem.spell.display.has_display matches 1 at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run function energy_manipulation:spell/display/find_display/start_r01
execute if score @s xem.spell.display.has_display matches 1 at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ as @e[type=minecraft:area_effect_cloud,distance=..0.01,tag=xem.spell.display.find_display.found,limit=1] run function energy_manipulation:spell/display/content/update
execute unless score @s xem.spell.display.has_display matches 1 store result storage energy_manipulation:op spell_display_data.rotation_x float 0.01 run scoreboard players get @s xlib.player.rotation_x
execute unless score @s xem.spell.display.has_display matches 1 store result storage energy_manipulation:op spell_display_data.rotation_y float 0.01 run scoreboard players get @s xlib.player.rotation_y
execute unless score @s xem.spell.display.has_display matches 1 at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run function energy_manipulation:spell/display/summon with storage energy_manipulation:op spell_display_data
