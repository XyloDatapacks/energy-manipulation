# <@> caster
# return:
#   1: success
#   0: fail

function energy_manipulation:spell/run/effect/release_potion/_get_potion/start
execute unless data storage energy_manipulation:op spell_effect.potion{id:"minecraft:potion"} run return 0
execute if data storage energy_manipulation:op spell_effect.potion{id:"minecraft:potion",tag:{smithed:{ignore:{functionality:1b}}}} run return 0

#convert from Potion to custom_potion_effect
scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.set_base_name xem.op 0
execute if data storage energy_manipulation:op spell_effect.potion.tag.Potion unless data storage energy_manipulation:op spell_effect.potion.tag{Potion:""} run function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/convert_potion/start

#decrease time and build potion effect array
data modify storage energy_manipulation:op potion_effects set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects
data remove storage energy_manipulation:op macro_data
execute store result score #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects
execute store result storage energy_manipulation:op macro_data.effect_i int 1 run scoreboard players remove #xem.spell.run.effect.release_potion.elaborate_potion.index xem.op 1
function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/loop with storage energy_manipulation:op macro_data

function energy_manipulation:spell/run/effect/release_potion/_set_potion/start 

scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.success xem.op 1
return 1