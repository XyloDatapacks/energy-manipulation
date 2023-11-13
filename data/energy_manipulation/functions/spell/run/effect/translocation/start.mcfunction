# <@> shape_marker or spell_marker

# teleport entity
execute if score xem.spell.run.effect.has_target_entity xem.op matches 1 run function energy_manipulation:spell/run/effect/translocation/tp

# sound
execute unless score xem.spell.run.effect.has_target_entity xem.op matches 1 run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~
