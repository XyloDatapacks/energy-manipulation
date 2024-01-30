tag @s remove xem.mind.meditation.is_meditating
scoreboard players operation @s xem.mind.meditation.end_time = #xlib.time xlib.op
scoreboard players remove @s xem.mind.meditation.end_time 1

scoreboard players set @s xem.mind.meditation.action.propel 0

function xylo_library:utilities/uuid/generate
function energy_manipulation:mind/meditation/exit/get_clone with storage gu:main {}


effect clear @s minecraft:invisibility
#TODO
# restore previous invisibility
# restore items

# remove scale down
# remove negative interaction range attributes