# particles
data modify storage energy_manipulation:op shape_particle_data set from storage energy_manipulation:op shape_tick_data
data modify storage energy_manipulation:op macro_data set value {effect:"none"}
data modify storage energy_manipulation:op macro_data.shape set from storage energy_manipulation:op shape_particle_data.shape.value
data modify storage energy_manipulation:op macro_data.effect set from storage energy_manipulation:op shape_particle_data.shape.effect.value
data modify storage energy_manipulation:op macro_data.effect_type set from storage energy_manipulation:op shape_particle_data.shape.effect.energy_type
execute at @s positioned ~ ~-0.125 ~ run function energy_manipulation:spell/run/shape/_particles/sort with storage energy_manipulation:op macro_data
