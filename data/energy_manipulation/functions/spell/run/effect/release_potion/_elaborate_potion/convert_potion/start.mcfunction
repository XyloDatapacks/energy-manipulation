#grab Potion type (base, long, strong) and id
scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op 0
data modify storage energy_manipulation:op release_potion_type set string storage energy_manipulation:op spell_effect.potion.tag.Potion 10 15
execute if data storage energy_manipulation:op {release_potion_type:"long_"} run scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op 1
execute if data storage energy_manipulation:op {release_potion_type:"stron"} run scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op 2
data remove storage energy_manipulation:op release_potion_id
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 0 run data modify storage energy_manipulation:op release_potion_id.name set string storage energy_manipulation:op spell_effect.potion.tag.Potion 10
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 1 run data modify storage energy_manipulation:op release_potion_id.name set string storage energy_manipulation:op spell_effect.potion.tag.Potion 15
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 2 run data modify storage energy_manipulation:op release_potion_id.name set string storage energy_manipulation:op spell_effect.potion.tag.Potion 17
#tellraw @a[tag=xem.debug] ["",{"storage":"energy_manipulation:op","nbt":"release_potion_id.name","color":"aqua"}]

#look up table
function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/convert_potion/build with storage energy_manipulation:op release_potion_id

#remove Potion tag
data remove storage energy_manipulation:op spell_effect.potion.tag.Potion
