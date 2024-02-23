execute store result score #xem.spell.run.shape.generic.particles xem.op run data get storage energy_manipulation:op shape_particle_data.spell_data.spell_book.energy_type_id
execute unless score #xlib.timer.4tick xlib.op matches 0 run scoreboard players set #xem.spell.run.shape.generic.particles xem.op 0
execute if score #xem.spell.run.shape.generic.particles xem.op matches 1 run function energy_manipulation:spell/run/shape/turret/particles/sun
execute if score #xem.spell.run.shape.generic.particles xem.op matches 2 run function energy_manipulation:spell/run/shape/turret/particles/ground
execute if score #xem.spell.run.shape.generic.particles xem.op matches 3 run function energy_manipulation:spell/run/shape/turret/particles/soul
execute if score #xem.spell.run.shape.generic.particles xem.op matches 4 run function energy_manipulation:spell/run/shape/turret/particles/dark
execute if score #xem.spell.run.shape.generic.particles xem.op matches 5 run function energy_manipulation:spell/run/shape/turret/particles/void

