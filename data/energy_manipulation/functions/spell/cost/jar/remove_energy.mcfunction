scoreboard players operation #xem.spell.cost.energy.jar.energy_to_remove xem.op = #xem.spell.cost.jar.energy_count xem.op
execute unless score #xem.spell.cost.remaining_cost xem.op matches 0.. run scoreboard players operation #xem.spell.cost.energy.jar.energy_to_remove xem.op += #xem.spell.cost.remaining_cost xem.op

scoreboard players operation #xem.spell.cost.energy.jar.energy_post_remove xem.op = #xem.spell.cost.jar.energy_count xem.op
scoreboard players operation #xem.spell.cost.energy.jar.energy_post_remove xem.op -= #xem.spell.cost.energy.jar.energy_to_remove xem.op

# fill
scoreboard players operation #xem.jar_of_energy.fill.last_count xem.op = #xem.spell.cost.energy.jar.energy_post_remove xem.op
execute store result storage energy_manipulation:op temp_data int 1 run scoreboard players get #xem.jar_of_energy.fill.last_count xem.op

# calc percentage
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op = #xem.spell.cost.energy.jar.energy_post_remove xem.op
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op *= #100 xconst
scoreboard players operation #xem.jar_of_energy.fill.percentage xem.op /= #xem.const.jar_of_energy.fill.limit xem.const

# modify item
execute store result score #xem.spell.cost.jar.slot xem.op store result storage energy_manipulation:op jar_slot.Slot byte 1 run data get storage energy_manipulation:op jars_in_inventory[0].Slot
# adjust slot
execute if score #xem.spell.cost.jar.slot xem.op matches 0..8 run function energy_manipulation:spell/cost/jar/remove_energy/hotbar with storage energy_manipulation:op jar_slot
execute if score #xem.spell.cost.jar.slot xem.op matches 9.. run function energy_manipulation:spell/cost/jar/remove_energy/inv_1
execute if score #xem.spell.cost.jar.slot xem.op matches -106 run item modify entity @s weapon.offhand energy_manipulation:jar_of_energy/fill

