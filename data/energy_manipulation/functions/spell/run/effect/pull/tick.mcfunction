#> energy_manipulation:spell/run/effect/pull/tick
# @context: server
# @within #energy_manipulation:effect_tick

#pull
execute as @e[type=minecraft:armor_stand,tag=xem.spell.run.effect.pull.entity] at @s run function energy_manipulation:spell/run/effect/pull/physics/tick
execute as @a[tag=xem.spell.run.effect.pull,predicate=!energy_manipulation:spell/run/effect/pull/is_being_pulled] run function energy_manipulation:spell/run/effect/pull/physics/push
