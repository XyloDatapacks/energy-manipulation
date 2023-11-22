execute align xyz if entity @e[type=minecraft:interaction,dy=0,tag=xem.jar_of_energy.block] run return 0

data remove storage energy_manipulation:op jar 
data modify storage energy_manipulation:op jar set from entity @s SelectedItem

execute if entity @s[y_rotation=-45..45] run summon minecraft:item_display ~ ~ ~ {Rotation:[90.0f,0.0f],item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.25f,0.0f]},Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block","xem.jar_of_energy.block_new","xem.jar_of_energy.generic"],Passengers:[{id:"minecraft:armor_stand",Small:1b,Invisible:1b,DisabledSlots:4144959,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:interaction",width:0.6,heigth:1,response:1,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:text_display",Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"],transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.75f,0.0f]},billboard:"vertical",default_background:0b,background:0,text:'{"text":"0"}'}]}
execute if entity @s[y_rotation=135..225] run summon minecraft:item_display ~ ~ ~ {Rotation:[90.0f,0.0f],item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.25f,0.0f]},Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block","xem.jar_of_energy.block_new","xem.jar_of_energy.generic"],Passengers:[{id:"minecraft:armor_stand",Small:1b,Invisible:1b,DisabledSlots:4144959,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:interaction",width:0.6,heigth:1,response:1,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:text_display",Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"],transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.75f,0.0f]},billboard:"vertical",default_background:0b,background:0,text:'{"text":"0"}'}]}
execute unless entity @s[y_rotation=-45..45] unless entity @s[y_rotation=135..225] run summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.25f,0.0f]},Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block","xem.jar_of_energy.block_new","xem.jar_of_energy.generic"],Passengers:[{id:"minecraft:armor_stand",Small:1b,Invisible:1b,DisabledSlots:4144959,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:interaction",width:0.6,heigth:1,response:1,Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"]},{id:"minecraft:text_display",Tags:["smithed.entity","smithed.strict","smithed.block","xem.jar_of_energy.block"],transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.75f,0.0f]},billboard:"vertical",default_background:0b,background:0,text:'{"text":"0"}'}]}

data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.type set string storage energy_manipulation:op jar.tag.xylo.id 27 -7
execute as @e[type=minecraft:item_display,distance=..0.1,tag=xem.jar_of_energy.block_new,limit=1] run function energy_manipulation:jar_of_energy/place/jar with storage energy_manipulation:op macro_data

item modify entity @s[gamemode=!creative] weapon.mainhand xylo_library:remove_count/1


#jar_of_energy: temp before retina fix
scoreboard players set #xem.jar_of_energy.place.temp.loop xem.op 0

#sound
playsound energy_manipulation:jar_of_energy.block.place block @a ~ ~ ~ 1 0.9

