#-> {yawn}

#body
$summon minecraft:area_effect_cloud ~ ~-0.55 ~ {Rotation:[$(yawn),$(pitch)],Duration:1000000000,Tags:["xem.meditation.entity"],Passengers:[{id:"minecraft:armor_stand",Rotation:[$(yawn)f,0.0f],Tags:["xem.meditation.entity","xem.meditation.entity_new"],Pose:{LeftArm:[-20.0f,0.0f,352.0f],RightArm:[-20.0f,0.0f,8.0f]},Invisible:1b,NoGravity:1b,NoBasePlate:1b,DisabledSlots:4144959,Passengers:[\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:1}},Tags:["head"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-0.545f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:2}},Tags:["arm_r"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.02f,-1024.485f,-0.03f],left_rotation:{angle:3.141590,axis:[0.0493865f, 0.98773f, -0.148159f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:3}},Tags:["arm_l"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[-0.02f,-2048.485f,-0.03f],left_rotation:{angle:3.141590,axis:[-0.0493865f, 0.98773f, -0.148159f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:4}},Tags:["torso"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-3072.475f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:5}},Tags:["leg_r"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-4097.175f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}},\
{id:"minecraft:item_display",Rotation:[$(yawn)f,0.0f],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$(name)",CustomModelData:6}},Tags:["leg_l"],item_display:"thirdperson_righthand",view_range:0.6f,transformation:{translation:[0.0f,-5121.175f,0.0f],left_rotation:{angle:3.141590,axis:[0.0f,1.0f,0.0f]},scale:[1.1f,1.1f,1.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}\
]}]}

data modify storage energy_manipulation:op temp_uuid set from entity @s UUID
tag @s add xem.meditation.player
execute positioned ~ ~-0.55 ~ as @e[type=minecraft:armor_stand,distance=..0.01,tag=xem.meditation.entity_new] run function energy_manipulation:mind/meditation/enter/set_entity_data
tag @s remove xem.meditation.player

