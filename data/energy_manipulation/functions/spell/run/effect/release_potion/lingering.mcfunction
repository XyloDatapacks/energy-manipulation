# sound
playsound energy_manipulation:spell.effect.release_potion player @a ~ ~ ~ 1 1

# get potion and remove duration (returns "energy_manipulation:op potion_effects")
scoreboard players set #xem.spell.run.effect.release_potion.elaborate_potion.success xem.op 0
$execute as $(caster_uuid) run function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/start
execute if score #xem.spell.run.effect.release_potion.elaborate_potion.success xem.op matches 0 run return 0

# summon aoe cloud
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["xem.spell.run.effect.release_potion_new"],ReapplicationDelay:20,Radius:2.5f,Duration:600,RadiusPerTick:-0.005f,RadiusOnUse:-2.5f,WaitTime:10}
data remove storage energy_manipulation:op temp_compound 
data modify storage energy_manipulation:op temp_compound.Color set from storage energy_manipulation:op spell_effect.potion.tag.CustomPotionColor
data modify storage energy_manipulation:op temp_compound.effects set from storage energy_manipulation:op potion_effects
data modify storage energy_manipulation:op temp_compound.Tags set value []
data modify entity @e[type=minecraft:area_effect_cloud,limit=1,distance=..0.001,tag=xem.spell.run.effect.release_potion_new] {} merge from storage energy_manipulation:op temp_compound 

