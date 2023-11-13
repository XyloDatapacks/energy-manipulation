# advancement reward function
advancement revoke @s only energy_manipulation:spell/book/craft/void
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

loot replace entity @s weapon.mainhand loot energy_manipulation:give/spell/book/void

# advancement
advancement grant @s only energy_manipulation:tutorial/spell/book/craft/void

# particles
execute anchored eyes rotated ~ 0 positioned ^-0.3 ^ ^0.45 run particle minecraft:dust 0.678 0.102 0.741 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force