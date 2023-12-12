







# summon aoe cloud
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["xem.spell.run.effect.release_potion_new"],CustomName:'{"translate":"energy_manipulation.spell.run.effect.release_potion.aoe"}',Age:-1,WaitTime:-1,Radius:0.0f,Duration:2,RadiusOnUse:-1f}
data remove storage energy_manipulation:op temp_compound 
data modify storage energy_manipulation:op temp_compound.Color set from storage energy_manipulation:op spell_effect.potion.tag.CustomPotionColor
data modify storage energy_manipulation:op temp_compound.effects set from storage energy_manipulation:op potion_effects
data modify storage energy_manipulation:op temp_compound.Owner set from storage energy_manipulation:op running_spell_data.caster_int 
data modify storage energy_manipulation:op temp_compound.Tags set value []
data modify entity @e[type=minecraft:area_effect_cloud,limit=1,distance=..0.001,tag=xem.spell.run.effect.release_potion_new] {} merge from storage energy_manipulation:op temp_compound 

