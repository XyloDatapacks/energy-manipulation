# <@> spell_display

# kill projectile
execute on vehicle run kill @s
# correct position 
function xylo_projectiles:position_correction/correct/start_no_origin
execute on passengers run kill @s[tag=xproj.position_correction]

# run effect and new elaborate
execute at @s on passengers if entity @s[tag=xem.spell.shape_marker] run function energy_manipulation:spell/run/shape/_projectile_type/tick/hit_action
kill @s

