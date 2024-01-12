# check distance
execute on vehicle at @s run function energy_manipulation:mind/meditation/from_body_check/return_check
# kill when time passed
execute if score #xlib.time xlib.op >= @s xem.mind.meditation.end_time on vehicle run function energy_manipulation:mind/meditation/exit/kill
# kill if player not found
function energy_manipulation:mind/meditation/from_body_check/player_existance_check with entity @s data.energy_manipulation.meditation