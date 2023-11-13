# init
data modify storage energy_manipulation:op spell_display_data set value {c0:"white",c1:"white",c2:"white",c3:"white",c4:"white",k0:"empty",k1:"empty",k2:"empty",k3:"empty",k4:"empty",v0:"empty",v1:"empty",v2:"empty",v3:"empty",v4:"empty",circle_cmd:12341013,circle_offset:1.6,i_center_1:"center_1",i_color:"white",info:"none"}

# get nest
data modify storage energy_manipulation:op spell_display_data_index set value {c0:5,c1:5,c2:5,c3:5,c4:5}
$data modify storage energy_manipulation:op spell_display_data_index.c0 set from storage energy_manipulation:op spell_display[$(0)].nest
$data modify storage energy_manipulation:op spell_display_data_index.c1 set from storage energy_manipulation:op spell_display[$(1)].nest
$data modify storage energy_manipulation:op spell_display_data_index.c2 set from storage energy_manipulation:op spell_display[$(2)].nest
$data modify storage energy_manipulation:op spell_display_data_index.c3 set from storage energy_manipulation:op spell_display[$(3)].nest
$data modify storage energy_manipulation:op spell_display_data_index.c4 set from storage energy_manipulation:op spell_display[$(4)].nest
# get colors from nest
execute store result score #xem.spell.display.content.get_data.energy_type xem.op run data get storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.energy_type_id
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 1 run function energy_manipulation:spell/display/content/get_data/color/sun with storage energy_manipulation:op spell_display_data_index
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 2 run function energy_manipulation:spell/display/content/get_data/color/ground with storage energy_manipulation:op spell_display_data_index
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 3 run function energy_manipulation:spell/display/content/get_data/color/soul with storage energy_manipulation:op spell_display_data_index
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 4 run function energy_manipulation:spell/display/content/get_data/color/dark with storage energy_manipulation:op spell_display_data_index
execute if score #xem.spell.display.content.get_data.energy_type xem.op matches 5 run function energy_manipulation:spell/display/content/get_data/color/void with storage energy_manipulation:op spell_display_data_index

# get keys
$execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.k0 set from storage energy_manipulation:op spell_display[$(0)].key
$execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.k1 set from storage energy_manipulation:op spell_display[$(1)].key
$execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.k2 set from storage energy_manipulation:op spell_display[$(2)].key
$execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.k3 set from storage energy_manipulation:op spell_display[$(3)].key
$execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.k4 set from storage energy_manipulation:op spell_display[$(4)].key

# get values
$data modify storage energy_manipulation:op spell_display_data.v0 set from storage energy_manipulation:op spell_display[$(0)].value
$data modify storage energy_manipulation:op spell_display_data.v1 set from storage energy_manipulation:op spell_display[$(1)].value
$data modify storage energy_manipulation:op spell_display_data.v2 set from storage energy_manipulation:op spell_display[$(2)].value
$data modify storage energy_manipulation:op spell_display_data.v3 set from storage energy_manipulation:op spell_display[$(3)].value
$data modify storage energy_manipulation:op spell_display_data.v4 set from storage energy_manipulation:op spell_display[$(4)].value

# cost for values
execute if score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data merge value {cost_0:"",cost_1:"",cost_2:"",cost_3:"",cost_4:"",cost_type_0:"",cost_type_1:"",cost_type_2:"",cost_type_3:"",cost_type_4:""}
$execute if score @s xem.spell.display.showing_value matches 1 if data storage energy_manipulation:op spell_display[$(0)] run function energy_manipulation:spell/display/content/get_data/node_cost/start {i:0,index:$(0)}
$execute if score @s xem.spell.display.showing_value matches 1 if data storage energy_manipulation:op spell_display[$(1)] run function energy_manipulation:spell/display/content/get_data/node_cost/start {i:1,index:$(1)}
$execute if score @s xem.spell.display.showing_value matches 1 if data storage energy_manipulation:op spell_display[$(2)] run function energy_manipulation:spell/display/content/get_data/node_cost/start {i:2,index:$(2)}
$execute if score @s xem.spell.display.showing_value matches 1 if data storage energy_manipulation:op spell_display[$(3)] run function energy_manipulation:spell/display/content/get_data/node_cost/start {i:3,index:$(3)}
$execute if score @s xem.spell.display.showing_value matches 1 if data storage energy_manipulation:op spell_display[$(4)] run function energy_manipulation:spell/display/content/get_data/node_cost/start {i:4,index:$(4)}

# circle
execute unless score @s xem.spell.display.has_display matches 1 run function energy_manipulation:spell/display/content/get_data/circle

# instructions
execute if score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.i_center_1 set value "center_1_values"


#info
execute unless score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.info set from storage energy_manipulation:op spell_display_data.k2
execute if score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.info set from storage energy_manipulation:op spell_display_data.v2
execute if score @s xem.spell.display.showing_value matches 1 run data modify storage energy_manipulation:op spell_display_data.info_key set from storage energy_manipulation:op display_content_node.key