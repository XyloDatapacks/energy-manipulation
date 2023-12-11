#get potion data

$data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects set from storage energy_manipulation:spell potions.Potion[{name:$(name)}].effects
$data modify storage energy_manipulation:op spell_effect.potion.tag.CustomPotionColor set from storage energy_manipulation:spell potions.Potion[{name:$(name)}].color

#==<First Effect>==#

#merge duration and amplifier
execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration set from storage energy_manipulation:spell potions.duration
execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier set from storage energy_manipulation:spell potions.amplifier

#duration
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 0 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration[0]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 1 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration[1]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 2 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].duration[2]

#amplifier
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 0 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier[0]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 1 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier[1]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 2 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[0].amplifier[2]

#==<Second Effect>==#
execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1] run return 1

#merge duration and amplifier
execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration set from storage energy_manipulation:spell potions.duration
execute unless data storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier set from storage energy_manipulation:spell potions.amplifier

#duration
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 0 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration[0]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 1 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration[1]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 2 store result storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration int 20 run data get storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].duration[2]

#amplifier
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 0 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier[0]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 1 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier[1]
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.type xem.op matches 2 run data modify storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier set from storage energy_manipulation:op spell_effect.potion.tag.custom_potion_effects[1].amplifier[2]