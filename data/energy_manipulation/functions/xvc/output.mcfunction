execute if score $energy_manipulation xvc.load_status matches 1 run tellraw @a ["",{"storage":"xvc_version:op","nbt":"packs[{namespace:energy_manipulation}].name","color":"aqua"},": loaded"]
execute if score $energy_manipulation xvc.load_status matches 0 run tellraw @a ["",{"storage":"xvc_version:op","nbt":"packs[{namespace:energy_manipulation}].name","color":"aqua"},": failed to load"]