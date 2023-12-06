# set distance
execute store result storage energy_manipulation:op target.half_size double 0.5 run data get storage energy_manipulation:op target_in.size
execute store result score #xem.spell.run.getters.target.volume_check.cube.size xem.op run data get storage energy_manipulation:op target_in.size
execute store result storage energy_manipulation:op target.size int 1 run scoreboard players remove #xem.spell.run.getters.target.volume_check.cube.size xem.op 1
