# advancement reward function
advancement revoke @s only energy_manipulation:jar_of_energy/block/left_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

function energy_manipulation:jar_of_energy/block/break/find