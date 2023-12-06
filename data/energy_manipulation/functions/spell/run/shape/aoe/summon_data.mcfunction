# contex shape_display


tp @s ~ ~ ~ ~ ~
# remove tag new
tag @s remove xem.spell.shape_display_new

# item
data modify entity @s item.tag.CustomModelData set from storage energy_manipulation:op shape_data.custom_model_data

# other data based on "energy_manipulation:op selected_concatenate.concatenate.shape"

# set movement and movement tags to projectile
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op selected_concatenate.concatenate.shape.movement.value
function energy_manipulation:spell/run/shape/_movement/sort with storage energy_manipulation:op macro_data
