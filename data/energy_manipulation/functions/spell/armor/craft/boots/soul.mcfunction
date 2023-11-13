# advancement reward function
advancement revoke @s only energy_manipulation:spell/armor/craft/boots/soul
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

loot replace entity @s weapon.mainhand loot energy_manipulation:give/spell/armor/boots/soul

# advancement
advancement grant @s only energy_manipulation:tutorial/spell/armor/craft/boots/soul

# particles
execute anchored eyes rotated ~ 0 positioned ^-0.3 ^ ^0.45 run particle minecraft:dust 0.059 0.675 0.753 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force