# advancement reward function
advancement revoke @s only energy_manipulation:inventory_changed
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


function #energy_manipulation:inventory_changed