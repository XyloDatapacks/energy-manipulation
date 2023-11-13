# advancement reward function
advancement revoke @s only energy_manipulation:jar_of_energy/fill/sun
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


function energy_manipulation:jar_of_energy/fill/_fill

# particles
execute anchored eyes rotated ~ 0 positioned ^-0.3 ^ ^0.45 run particle minecraft:dust 0.576 0.145 0.035 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force