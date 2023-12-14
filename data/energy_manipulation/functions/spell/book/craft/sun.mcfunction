# advancement reward function
advancement revoke @s only energy_manipulation:spell/book/craft/sun
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

loot replace entity @s weapon.mainhand loot energy_manipulation:give/spell/book/sun

# advancement
advancement grant @s only energy_manipulation:tutorial/spell/book/craft/sun

# particles
execute anchored eyes positioned ^-0.3 ^-0.3 ^0.45 run function energy_manipulation:spell/cast/particles/sun