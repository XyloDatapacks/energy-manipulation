# angle / 90 * 90

execute store result score #xem.spell.run.getters.direction.align.yawn xem.op run data get storage energy_manipulation:op initial_rotation[0] 
execute store result score #xem.spell.run.getters.direction.align.pitch xem.op run data get storage energy_manipulation:op initial_rotation[1]

scoreboard players add #xem.spell.run.getters.direction.align.yawn xem.op 45
scoreboard players add #xem.spell.run.getters.direction.align.pitch xem.op 45

scoreboard players operation #xem.spell.run.getters.direction.align.yawn xem.op /= #90 xconst
scoreboard players operation #xem.spell.run.getters.direction.align.pitch xem.op /= #90 xconst

data modify storage energy_manipulation:op direction_out set value [0.0f,0.0f]
execute store result storage energy_manipulation:op direction_out[0] float 1 run scoreboard players operation #xem.spell.run.getters.direction.align.yawn xem.op *= #90 xconst
execute store result storage energy_manipulation:op direction_out[1] float 1 run scoreboard players operation #xem.spell.run.getters.direction.align.pitch xem.op *= #90 xconst

