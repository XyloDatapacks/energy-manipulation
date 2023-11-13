# damage
scoreboard players operation #xem.spell.cost.withering.total_damage_to_pay xem.op = @s xem.spell.cost.withering.total_damage_to_pay
execute store result storage energy_manipulation:op macro_data_a.damage double 0.01 run scoreboard players operation #xem.spell.cost.withering.total_damage_to_pay xem.op < #250 xconst
# tellraw @a[tag=xem.debug] ["cost_async dmg: ",{"score":{"objective":"xem.op","name":"#xem.spell.cost.withering.total_damage_to_pay"}}," / ",{"score":{"objective":"xem.spell.cost.withering.total_damage_to_pay","name":"@s"}}]
scoreboard players remove @s xem.spell.cost.withering.total_damage_to_pay 250
