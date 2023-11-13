# prepare next cycle (regardless, cause it acts as a cooldown to prevent another cost is applied before the previous one is paid)
scoreboard players set @s xem.spell.cost.withering.withering_async_time 5
scoreboard players operation @s xem.spell.cost.withering.withering_async_time += #xlib.time xlib.op

# init
data modify storage energy_manipulation:op macro_data_a set value {damage:0.00000000000001}
# setup saturation cost
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op = @s xem.spell.cost.withering.total_saturation_to_pay
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op > #0 xconst
execute store result storage energy_manipulation:op macro_data_a.saturation int 1 run scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op < #5 xconst
scoreboard players remove @s xem.spell.cost.withering.total_saturation_to_pay 5
# damage?
execute unless score @s xem.spell.cost.withering.total_saturation_to_pay matches 1.. if score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. run function energy_manipulation:spell/cost/withering/damage

# tellraw @a[tag=xem.debug] ["sat ",{"score":{"objective":"xem.spell.cost.withering.total_saturation_to_pay","name":"@s"}}," | dmg ",{"score":{"objective":"xem.spell.cost.withering.total_damage_to_pay","name":"@s"}}]

# pay
effect give @s minecraft:darkness 1 0 true
effect give @s minecraft:hunger 1 0 false
function energy_manipulation:spell/cost/withering/pay with storage energy_manipulation:op macro_data_a
execute at @s run playsound energy_manipulation:spell.cost.energy_withering player @a ~ ~ ~ 1 2

# debug cost
execute store result score #temp xem.debug.cost_since_last_spell run data get storage energy_manipulation:op macro_data_a.saturation 10
scoreboard players operation #temp xem.debug.cost_since_last_spell /= #2 xconst
scoreboard players operation @s xem.debug.cost_since_last_spell += #temp xem.debug.cost_since_last_spell

execute store result score #temp xem.debug.cost_since_last_spell run data get storage energy_manipulation:op macro_data_a.damage 10
scoreboard players operation @s xem.debug.cost_since_last_spell += #temp xem.debug.cost_since_last_spell
