# grab hit entity
scoreboard players operation @s xproj.position_correction.creation_time = #xlib.time xlib.op
function xylo_projectiles:position_correction/correct/start_no_origin

# bounce
data remove storage energy_manipulation:op macro_data
execute facing ^ ^ ^-1 run function energy_manipulation:spell/run/shape/_movement/_motion {initial_speed:0.3}
function energy_manipulation:mind/meditation/from_mind_check/bounce1 with storage energy_manipulation:op macro_data


# attack
function energy_manipulation:mind/meditation/attack/start with storage xylo_projectiles:op entity_hit

