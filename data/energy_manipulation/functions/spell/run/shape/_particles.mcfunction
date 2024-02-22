# particles
data modify storage energy_manipulation:op shape_particle_data set from storage energy_manipulation:op shape_tick_data
data modify storage energy_manipulation:op macro_data set value {effect:"none"}
data modify storage energy_manipulation:op macro_data.shape set from storage energy_manipulation:op shape_particle_data.shape.value
data modify storage energy_manipulation:op macro_data.effect set from storage energy_manipulation:op shape_particle_data.shape.effect.value
execute at @s run function energy_manipulation:spell/run/effect/particles with storage energy_manipulation:op macro_data
