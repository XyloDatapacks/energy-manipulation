# advancement reward function
advancement revoke @s only energy_manipulation:jar_of_energy/craft/ground
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

# give
function energy_manipulation:jar_of_energy/_preset/first_fill
loot replace entity @s weapon.mainhand loot energy_manipulation:give/jar_of_energy/ground

# advancement
advancement grant @s only energy_manipulation:tutorial/jar_of_energy/craft/ground

# particles
execute anchored eyes positioned ^-0.3 ^-0.3 ^0.45 run function energy_manipulation:spell/cast/particles/ground