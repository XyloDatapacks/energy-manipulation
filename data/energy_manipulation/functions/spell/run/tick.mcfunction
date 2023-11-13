# shape_tick, in caso di successo, riattiva il marker (o ne summona uno nuovo) e esegue "elaborate/start".
# una shape creata da shape_tick, deve aspettare il ciclo seguente per eseguire shape_tick
# usando questo switch, anche le shape create da shape_tick, devono aspettare il ciclo seguente per eseguire shape_tick

# check if caster died (out: "#xem.spell.run.caster_still_alive xem.op")
data remove storage energy_manipulation:op macro_data
data modify storage energy_manipulation:op macro_data.caster set from entity @s data.energy_manipulation.spell_data.caster
function energy_manipulation:spell/run/_check_caster_death/start with storage energy_manipulation:op macro_data

# sort type
execute store success score #xem.spell.run.shape_tick xem.op if entity @s[tag=xem.spell.shape_marker]
execute if score #xem.spell.run.shape_tick xem.op matches 0 if entity @s[tag=!xem.spell.inactive] run function energy_manipulation:spell/run/elaborate/start 
execute if score #xem.spell.run.shape_tick xem.op matches 1 run function energy_manipulation:spell/run/shape_tick/start 

