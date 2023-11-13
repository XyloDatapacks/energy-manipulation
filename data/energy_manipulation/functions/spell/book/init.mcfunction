# generate data
data modify storage energy_manipulation:op input_node_value set from storage energy_manipulation:spell nodes_values.concatenate[0]
function energy_manipulation:spell/build/add_node {key:"concatenate",path:"main"}

# reset index to show
execute store result storage energy_manipulation:op spell_display.2 int 1 run scoreboard players set @s xem.spell.display.index_input 0

# copy data in item
item modify entity @s weapon.mainhand energy_manipulation:spell/book/update_data


