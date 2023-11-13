# <@> shape_marker or spell_marker

# push entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/push/motion

# sound
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run playsound energy_manipulation:spell.effect.push player @a ~ ~ ~ 1 1
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run particle minecraft:sonic_boom ^ ^ ^-0.2 0.1 0.1 0.1 1 0 force