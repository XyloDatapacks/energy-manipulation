# get first jar
execute store result score #xem.spell.cost.jar.energy_count xem.op run data get storage energy_manipulation:op jars_in_inventory[0].tag.energy_manipulation.energy_count
scoreboard players operation #xem.spell.cost.jar.energy_count xem.op > #0 xconst

# subtract energy
# tellraw @a[tag=xem.debug] [{"score":{"objective":"xem.op","name":"#xem.spell.cost.remaining_cost"}}," - ",{"score":{"objective":"xem.op","name":"#xem.spell.cost.jar.energy_count"}}]
scoreboard players operation #xem.spell.cost.remaining_cost xem.op -= #xem.spell.cost.jar.energy_count xem.op

# remove energy from jar
function energy_manipulation:spell/cost/jar/remove_energy

# if all cost paid, return
execute unless score #xem.spell.cost.remaining_cost xem.op matches 1.. run return 1

# loop
data remove storage energy_manipulation:op jars_in_inventory[0]
scoreboard players remove #xem.spell.cost.jar.jar_count xem.op 1
execute if score #xem.spell.cost.jar.jar_count xem.op matches 1.. run function energy_manipulation:spell/cost/jar/loop