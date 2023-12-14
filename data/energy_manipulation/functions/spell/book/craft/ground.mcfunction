# advancement reward function
advancement revoke @s only energy_manipulation:spell/book/craft/ground
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

loot replace entity @s weapon.mainhand loot energy_manipulation:give/spell/book/ground

# advancement
advancement grant @s only energy_manipulation:tutorial/spell/book/craft/ground

# particles
execute anchored eyes positioned ^-0.3 ^-0.3 ^0.45 run function energy_manipulation:spell/cast/particles/ground