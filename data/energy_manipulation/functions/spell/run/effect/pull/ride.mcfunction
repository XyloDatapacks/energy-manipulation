# -> {uuid, position_x, position_y, position_z, dimension}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

#particles
$execute positioned 0.0 0.0 0.0 run particle minecraft:sonic_boom ~$(position_x) ~$(position_y) ~$(position_z) 0.1 0.1 0.1 1 0 force
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run playsound energy_manipulation:spell.effect.pull player @a ~ ~ ~
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run return 0

$execute at $(uuid) run playsound energy_manipulation:spell.effect.pull player @a ~ ~ ~ 

#==<Validation Exit>==#
execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0
execute if score #xem.spell.run.effect.validate_target xem.op matches -3..-1 run return 0
#=====================#

scoreboard players set #xem.spell.run.effect.pull.was_riding xem.op 0
$execute as $(uuid) if predicate xylo_library:riding store success score #xem.spell.run.effect.pull.was_riding xem.op run ride @s dismount
$execute as $(uuid) if entity @s[tag=xem.spell.run.effect.pull] run scoreboard players set #xem.spell.run.effect.pull.was_riding xem.op 2

#block if different dimension
$execute at $(uuid) run function xylo_library:utilities/get_dimension_id/get
execute store success score #xem.spell.run.effect.pull.same_dimension xem.op run data modify storage xylo_library:op get_dimension_id.dimension set from storage energy_manipulation:op macro_data.dimension
execute if score #xem.spell.run.effect.pull.same_dimension xem.op matches 1 run return 0

#do stuff (-0.388)
$execute unless score #xem.spell.run.effect.pull.was_riding xem.op matches 2 at $(uuid) run summon minecraft:armor_stand ~ ~-0.3866 ~ {Small:1b,Invisible:1b,NoGravity:0b,DisabledSlots:4144959,Motion:[0.0d,-0.078d,0.0d],Tags:["smithed.entity","smithed.strict","iris.ignore","xlib.non_interactive","xem.spell.run.effect.pull.entity","xem.spell.run.effect.pull.entity_new"]}
$execute unless score #xem.spell.run.effect.pull.was_riding xem.op matches 2 at $(uuid) positioned ~ ~-0.3866 ~ as @e[type=minecraft:armor_stand,distance=..0.01,tag=xem.spell.run.effect.pull.entity_new,limit=1] run function energy_manipulation:spell/run/effect/pull/ride2 with storage energy_manipulation:op macro_data
$execute if score #xem.spell.run.effect.pull.was_riding xem.op matches 2 at $(uuid) run summon minecraft:armor_stand ~ ~-0.9874 ~ {Small:1b,Invisible:1b,NoGravity:0b,DisabledSlots:4144959,Motion:[0.0d,-0.078d,0.0d],Tags:["smithed.entity","smithed.strict","iris.ignore","xlib.non_interactive","xem.spell.run.effect.pull.entity","xem.spell.run.effect.pull.entity_new"]}
$execute if score #xem.spell.run.effect.pull.was_riding xem.op matches 2 at $(uuid) positioned ~ ~-0.9874 ~ as @e[type=minecraft:armor_stand,distance=..0.01,tag=xem.spell.run.effect.pull.entity_new,limit=1] run function energy_manipulation:spell/run/effect/pull/ride2 with storage energy_manipulation:op macro_data
