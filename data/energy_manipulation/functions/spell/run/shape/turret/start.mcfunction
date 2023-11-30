# summon
summon minecraft:item_display ~ ~ ~ {brightness:{block:15,sky:15},teleport_duration:3,billboard:"fixed",transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.0f,0.0f]},Tags:["smithed.entity","smithed.strict","xem.spell.shape_display","xem.spell.shape_display_new"],item_display:fixed,item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:12340000}}}
ride @s mount @e[type=minecraft:item_display,distance=..0.001,tag=xem.spell.shape_display_new,limit=1]
# get cmd
data modify storage energy_manipulation:op macro_data set value {shape:"turret"}
data modify storage energy_manipulation:op macro_data.energy_type set from storage energy_manipulation:op selected_concatenate.concatenate.cost.type
function energy_manipulation:spell/run/shape/_model/start
# apply data
execute on vehicle run function energy_manipulation:spell/run/shape/turret/summon_data



# pass shape to spell_marker
data modify storage energy_manipulation:op running_spell_marker_update.data.energy_manipulation.shape set from storage energy_manipulation:op selected_concatenate.concatenate.shape

# deactivate spell marker and add tags
data modify storage energy_manipulation:op temp_array set value ["xem.spell.inactive","xem.spell.shape_marker","xem.spell.turret_type"]
data modify storage energy_manipulation:op running_spell_marker_update.Tags append from storage energy_manipulation:op temp_array[]

# expire_time (+1 tick cause shape tick always executes on the next tick)
execute store result score #xem.spell.run.shape.expire_time xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.shape.duration 20
scoreboard players operation #xem.spell.run.shape.expire_time xem.op += #xlib.time xlib.op
scoreboard players add #xem.spell.run.shape.expire_time xem.op 1
scoreboard players operation @s xem.spell.shape.expire_time = #xem.spell.run.shape.expire_time xem.op

# conditions
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.condition{value:"none"} run function energy_manipulation:spell/run/shape/turret/condition/none
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.condition{value:"cooldown"} run function energy_manipulation:spell/run/shape/turret/condition/cooldown
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.condition{value:"target"} run function energy_manipulation:spell/run/shape/turret/condition/target

# fire mode
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{value:"once"} run data modify storage energy_manipulation:op running_spell_marker_update.Tags append value "xem.spell.turret_type.fm.once"
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{value:"condition"} run data modify storage energy_manipulation:op running_spell_marker_update.Tags append value "xem.spell.turret_type.fm.condition"
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{value:"repeat"} run function energy_manipulation:spell/run/shape/turret/fire_mode/repeat

# (+1 tick cause shape tick always executes on the next tick)
scoreboard players add @s xem.spell.shape.activation_time 1


#shape sound
playsound energy_manipulation:spell.run.shape_creation player @a ~ ~-0.5 ~ 3.0 1