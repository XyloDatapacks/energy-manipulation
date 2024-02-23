execute store result score #xem.spell.run.effect.none.particles xem.op run data get storage energy_manipulation:op shape_particle_data.spell_data.spell_book.energy_type_id
execute if score #xem.spell.run.effect.none.particles xem.op matches 1 run function energy_manipulation:spell/run/shape/projectile/particles/sun
execute if score #xem.spell.run.effect.none.particles xem.op matches 2 run function energy_manipulation:spell/run/shape/projectile/particles/ground
execute if score #xem.spell.run.effect.none.particles xem.op matches 3 run function energy_manipulation:spell/run/shape/projectile/particles/soul
execute if score #xem.spell.run.effect.none.particles xem.op matches 4 run function energy_manipulation:spell/run/shape/projectile/particles/dark
execute if score #xem.spell.run.effect.none.particles xem.op matches 5 run function energy_manipulation:spell/run/shape/projectile/particles/void


