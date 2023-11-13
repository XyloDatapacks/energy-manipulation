execute store result score #xem.spell.run.effect.none.particles xem.op run data get storage energy_manipulation:op shape_particle_data.spell_data.spell_book.energy_type_id
execute unless score #xlib.timer.4tick xlib.op matches 0 run scoreboard players set #xem.spell.run.effect.none.particles xem.op 0
execute if score #xem.spell.run.effect.none.particles xem.op matches 1 run function energy_manipulation:spell/run/effect/none/particles/turret/sun
execute if score #xem.spell.run.effect.none.particles xem.op matches 2 run function energy_manipulation:spell/run/effect/none/particles/turret/ground
execute if score #xem.spell.run.effect.none.particles xem.op matches 3 run function energy_manipulation:spell/run/effect/none/particles/turret/soul
execute if score #xem.spell.run.effect.none.particles xem.op matches 4 run function energy_manipulation:spell/run/effect/none/particles/turret/dark
execute if score #xem.spell.run.effect.none.particles xem.op matches 5 run function energy_manipulation:spell/run/effect/none/particles/turret/void

