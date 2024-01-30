# check from mind stack
data modify storage energy_manipulation:op macro_dataaa set from entity @s data.energy_manipulation.mind.meditation
function energy_manipulation:mind/meditation/from_mind_check/check with storage energy_manipulation:op macro_dataaa

# correct
execute on vehicle if predicate xylo_library:no_vehicle at @s run function energy_manipulation:mind/meditation/from_mind_check/bounce
# for proj correction
execute on vehicle run function xylo_projectiles:position_correction/tick/start


