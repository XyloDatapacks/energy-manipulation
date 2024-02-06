# <@> item_display

# grab hit entity
scoreboard players operation @s xproj.position_correction.creation_time = #xlib.time xlib.op
function xylo_projectiles:position_correction/correct/start_no_origin

# attack (getting origin_uuid too if existing, if not init it with uuid value)
data modify storage energy_manipulation:op target_out set value []
data modify storage energy_manipulation:op target_out append from storage xylo_projectiles:op entity_hit
scoreboard players set #xem.spell.run.getters.target._reroute.selector_type xem.op 1
scoreboard players set #xem.spell.run.getters.target._reroute.max_iterations xem.op 3
function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]
execute unless data storage energy_manipulation:op target_out[-1].origin_uuid run data modify storage energy_manipulation:op target_out[-1].origin_uuid set from storage energy_manipulation:op target_out[-1].uuid
execute unless score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 at @s run function energy_manipulation:mind/meditation/attack/start with storage energy_manipulation:op target_out[-1]

# bounce
data remove storage energy_manipulation:op macro_data
execute on passengers if entity @s[type=minecraft:marker,tag=xem.mind.meditation.mind_entity] run data modify storage energy_manipulation:op macro_data.hitbox_uuid set from entity @s data.energy_manipulation.mind.meditation.clone_hitbox_uuid
execute facing ^ ^ ^-1 run function energy_manipulation:spell/run/shape/_movement/_motion {initial_speed:0.1}
execute at @s run function energy_manipulation:mind/meditation/from_mind_check/bounce1 with storage energy_manipulation:op macro_data

