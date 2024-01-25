#==<Body>==#
data modify storage xylo_library:op clone_input_data set value {tags:["xem.mind.meditation.entity"],hitbox:{tags:["xem.mind.meditation.entity"]},marker:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]},aoe:{tags:["xem.spell.non_selectable","xem.mind.meditation.entity"]}}
execute store result storage xylo_library:op clone_input_data.duration int 1 run scoreboard players get #xem.mind.meditation.duration xem.op
function xylo_library:internal/clone/generate/start