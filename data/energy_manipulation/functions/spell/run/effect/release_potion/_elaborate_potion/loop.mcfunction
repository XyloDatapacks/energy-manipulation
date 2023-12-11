#edit potion and store effects to apply
$execute store result score #xem.spell.run.effect.release_potion.elaborate_potion.duration.$(effect_i) xem.op run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[$(effect_i)].duration 
$execute store result score #xem.spell.run.effect.release_potion.elaborate_potion.duration_to_use.$(effect_i) xem.op run data get storage energy_manipulation:op spell_effect.effect.potion_duration 20
$execute store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[$(effect_i)].duration int 1 run scoreboard players operation #xem.spell.run.effect.release_potion.elaborate_potion.duration.$(effect_i) xem.op -= #xem.spell.run.effect.release_potion.elaborate_potion.duration_to_use.$(effect_i) xem.op
$execute if score #xem.spell.run.effect.release_potion.elaborate_potion.duration.$(effect_i) xem.op matches ..-1 run scoreboard players operation #xem.spell.run.effect.release_potion.elaborate_potion.duration_to_use.$(effect_i) xem.op += #xem.spell.run.effect.release_potion.elaborate_potion.duration.$(effect_i) xem.op
$execute store result storage energy_manipulation:op potion_effects[$(effect_i)].duration int 1 run scoreboard players get #xem.spell.run.effect.release_potion.elaborate_potion.duration_to_use.$(effect_i) xem.op

execute store result storage energy_manipulation:op macro_data.effect_i int 1 run scoreboard players remove #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op 1
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op matches 0.. run function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/loop with storage energy_manipulation:op macro_data

$execute if score #xem.spell.run.effect.release_potion.elaborate_potion.duration.$(effect_i) xem.op matches ..-1 run data remove storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[$(effect_i)] 