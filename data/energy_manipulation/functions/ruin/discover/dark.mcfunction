# advancement reward function
execute if score $energy_manipulation xvc.load_status matches 0 run advancement revoke @s only energy_manipulation:spell/display/content/get_node_values/effect/dark
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------
