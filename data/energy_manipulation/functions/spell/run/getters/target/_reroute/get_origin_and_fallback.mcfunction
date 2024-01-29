# <@> entity with tag "xem.spell.run.getters.target._reroute.entity"
# fetches the origin_uuid accordingly and set if has to use fallback or not

# in: "energy_manipulation:op target_out[-1]"

# out:
#   adjusted "energy_manipulation:op target_out[-1]"


#==<Get Origin>==#
# if the origin should be targeted in case this reroute is not found, then init the fallback tag

execute if entity @s[tag=xem.mind.meditation.entity] on vehicle on passengers if entity @s[type=minecraft:marker,tag=xem.mind.meditation.entity] run data modify storage energy_manipulation:op target_out[-1].origin_uuid set from entity @s data.xylo_library.clone.player_hex_uuid
execute if entity @s[tag=xem.mind.meditation.entity] run data modify storage energy_manipulation:op target_out[-1].fallback set value 1b



