# in: #xem.spell.cost.remaining_cost xem.op

data modify storage energy_manipulation:op temp_player_data set from entity @s {}

scoreboard players operation @s xem.spell.cost.withering.total_saturation_to_pay > #0 xconst
scoreboard players operation @s xem.spell.cost.withering.total_damage_to_pay > #0 xconst

execute store result score #xem.spell.cost.withering.total_food_level xem.op run data get storage energy_manipulation:op temp_player_data.foodLevel
execute store result score #xem.spell.cost.withering.food_saturation_level xem.op run data get storage energy_manipulation:op temp_player_data.foodSaturationLevel
scoreboard players operation #xem.spell.cost.withering.total_food_level xem.op += #xem.spell.cost.withering.food_saturation_level xem.op
scoreboard players operation #xem.spell.cost.withering.total_food_level xem.op -= @s xem.spell.cost.withering.total_saturation_to_pay

# delta food level
scoreboard players operation #xem.spell.cost.remaining_cost*2 xem.op = #xem.spell.cost.remaining_cost xem.op
scoreboard players operation #xem.spell.cost.remaining_cost*2 xem.op *= #2 xconst
scoreboard players operation #xem.spell.cost.withering.total_food_level_post_pay xem.op = #xem.spell.cost.withering.total_food_level xem.op
scoreboard players operation #xem.spell.cost.withering.total_food_level_post_pay xem.op -= #xem.spell.cost.remaining_cost*2 xem.op
# if i paid all the cost, set the remaining cost to 0. else remove from remaining cost the part paid
execute if score #xem.spell.cost.withering.total_food_level_post_pay xem.op matches 0.. run scoreboard players set #xem.spell.cost.remaining_cost*2 xem.op 0
execute unless score #xem.spell.cost.withering.total_food_level_post_pay xem.op matches 0.. run scoreboard players operation #xem.spell.cost.remaining_cost*2 xem.op = #xem.spell.cost.withering.total_food_level_post_pay xem.op
scoreboard players operation #xem.spell.cost.remaining_cost*2 xem.op *= #-1 xconst
scoreboard players operation #xem.spell.cost.withering.total_food_level_post_pay xem.op > #0 xconst

# saturation 
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op = #xem.spell.cost.withering.total_food_level xem.op
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op -= #xem.spell.cost.withering.total_food_level_post_pay xem.op
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op > #0 xconst
scoreboard players operation #xem.spell.cost.withering.total_saturation_to_pay xem.op < #40 xconst
scoreboard players operation @s xem.spell.cost.withering.total_saturation_to_pay += #xem.spell.cost.withering.total_saturation_to_pay xem.op

# damage (remaining cost *100/2 -> damage scale *100)
scoreboard players operation #xem.spell.cost.remaining_cost*2 xem.op *= #50 xconst
scoreboard players operation @s xem.spell.cost.withering.total_damage_to_pay += #xem.spell.cost.remaining_cost*2 xem.op

# failed spell
scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 1
execute if score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. store result score #xem.spell.cost.withering.health xem.op run data get storage energy_manipulation:op temp_player_data.Health 100
execute if score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. run scoreboard players operation #xem.spell.cost.withering.health xem.op -= @s xem.spell.cost.withering.total_damage_to_pay
execute if score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. unless score #xem.spell.cost.withering.health xem.op matches 0.. run scoreboard players set #xem.spell.cost.energy.cost_payed xem.op 0

