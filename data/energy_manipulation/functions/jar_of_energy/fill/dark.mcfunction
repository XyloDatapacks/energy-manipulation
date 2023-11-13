# advancement reward function
advancement revoke @s only energy_manipulation:jar_of_energy/fill/dark
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


function energy_manipulation:jar_of_energy/fill/_fill

# particles
execute anchored eyes rotated ~ 0 positioned ^-0.3 ^ ^0.45 run particle minecraft:dust 0.016 0.376 0.306 1 ~ ~-0.4 ~ 0.15 0.15 0.15 1 10 force