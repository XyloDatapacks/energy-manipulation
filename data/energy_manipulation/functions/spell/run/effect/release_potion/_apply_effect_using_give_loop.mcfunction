$effect give @s $(id) $(duration) $(amplifier)

#loop check
scoreboard players remove #xem.spell.run.effect.release_potion.number xem.op 1
execute unless score #xem.spell.run.effect.release_potion.number xem.op matches 1.. run return 1

#loop
data remove storage energy_manipulation:op potion_effects[0]
execute store result score #xem.spell.run.effect.release_potion.duration xem.op run data get storage energy_manipulation:op potion_effects[0].duration 0.05
execute store result storage energy_manipulation:op potion_effects[0].duration int 1 run scoreboard players operation #xem.spell.run.effect.release_potion.duration xem.op > #1 xconst
function energy_manipulation:spell/run/effect/release_potion/_apply_effect_using_give_loop with storage energy_manipulation:op potion_effects[0]
