# summon
summon minecraft:item_display ~ ~ ~ {brightness:{block:15,sky:15},teleport_duration:3,billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.0f,0.0f]},Tags:["smithed.entity","smithed.strict","xem.spell.shape_display","xem.spell.shape_display_new"],item_display:fixed,item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}},Passengers:[\
{id:"minecraft:item_display",brightness:{block:15,sky:15},teleport_duration:3,billboard:"fixed",interpolation_duration:20,start_interpolation:0,transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.0f,0.0f]},Tags:["smithed.entity","smithed.strict","xem.spell.shape_display","xem.spell.shape_display.aoe.big"],item_display:fixed,item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}}}\
]}

ride @s mount @e[type=minecraft:item_display,distance=..0.001,tag=xem.spell.shape_display_new,limit=1]
# get cmd
data modify storage energy_manipulation:op macro_data set value {shape:"aoe"}
data modify storage energy_manipulation:op macro_data.energy_type set from storage energy_manipulation:op selected_concatenate.concatenate.cost.type
function energy_manipulation:spell/run/shape/_model/start
# apply data
execute on vehicle run function energy_manipulation:spell/run/shape/aoe/summon_data
scoreboard players operation @s xem.spell.run.shape.aoe.expand_time = #xem.spell.run.shape.aoe.expand_time xem.op

# pass shape to spell_marker
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.shape set from storage energy_manipulation:op selected_concatenate.concatenate.shape

# deactivate spell marker and add tags
data modify storage energy_manipulation:op temp_array set value ["xem.spell.inactive","xem.spell.shape_marker","xem.spell.aoe_type","xem.spell.run.shape.aoe.expand"]
data modify storage energy_manipulation:op running_spell_marker_update.Tags append from storage energy_manipulation:op temp_array[]

# expire_time (+1 tick cause shape tick always executes on the next tick)
execute store result score #xem.spell.run.shape.expire_time xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.shape.duration 20
scoreboard players operation #xem.spell.run.shape.expire_time xem.op += #xlib.time xlib.op
scoreboard players add #xem.spell.run.shape.expire_time xem.op 1
scoreboard players operation @s xem.spell.shape.expire_time = #xem.spell.run.shape.expire_time xem.op

#activation time
scoreboard players operation @s xem.spell.shape.activation_time = #xlib.time xlib.op
scoreboard players add @s xem.spell.shape.activation_time 1

# fire rate
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape{fire_rate:"really_slow"} run scoreboard players set @s xem.spell.shape.fire_rate 60
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape{fire_rate:"slow"} run scoreboard players set @s xem.spell.shape.fire_rate 40
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape{fire_rate:"average"} run scoreboard players set @s xem.spell.shape.fire_rate 20
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape{fire_rate:"fast"} run scoreboard players set @s xem.spell.shape.fire_rate 10
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape{fire_rate:"really_fast"} run scoreboard players set @s xem.spell.shape.fire_rate 5




#increase "xem.spell.aoes_casted_in_tick" for caster
function energy_manipulation:spell/run/shape/aoe/increase_aoes_counter with storage energy_manipulation:op running_spell_data

#shape sound
playsound energy_manipulation:spell.run.shape_creation player @a ~ ~-0.5 ~ 3.0 1