# <@> caster

function energy_manipulation:spell/run/effect/release_potion/_get_potion/start

data modify storage energy_manipulation:op potion_effects set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects
data remove storage energy_manipulation:op macro_data
execute store result score #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects
execute store result storage energy_manipulation:op macro_data.effect_i int 1 run scoreboard players remove #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op 1
function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/loop with storage energy_manipulation:op macro_data

function energy_manipulation:spell/run/effect/release_potion/_set_potion/start 