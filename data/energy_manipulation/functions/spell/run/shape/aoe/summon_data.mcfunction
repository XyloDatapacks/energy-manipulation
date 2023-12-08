# contex shape_display


tp @s ~ ~ ~ 0 0
# remove tag new
tag @s remove xem.spell.shape_display_new

# item
data modify entity @s item.tag.CustomModelData set from storage energy_manipulation:op shape_data.custom_model_data

# other data based on "energy_manipulation:op selected_concatenate.concatenate.shape"

# set movement and movement tags to projectile
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.value
function energy_manipulation:spell/run/shape/_movement/sort with storage energy_manipulation:op macro_data

#secondary display
execute on passengers if entity @s[tag=xem.spell.shape_display.aoe.big] store result score @s xem.spell.run.shape.aoe.size run data get storage energy_manipulation:op selected_concatenate.concatenate.shape.size
execute on passengers run data modify entity @s[tag=xem.spell.shape_display.aoe.big] item.tag.CustomModelData set from storage energy_manipulation:op shape_data.custom_model_data
scoreboard players operation #xem.spell.run.shape.aoe.expand_time xem.op = #xlib.time xlib.op
scoreboard players add #xem.spell.run.shape.aoe.expand_time xem.op 3
#score gets applied to marker