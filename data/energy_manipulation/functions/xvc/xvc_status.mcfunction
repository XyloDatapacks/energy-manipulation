function energy_manipulation:xvc/xvc_load_name

execute unless score $energy_manipulation xvc.load_status matches 0 run tellraw @a ["",{"text":"> ","color":"white"},{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":": ","color":"white"},{"text": "successfully loaded","color":"green"}]
execute if score $energy_manipulation xvc.load_status matches 0 run tellraw @a ["",{"text":"> ","color":"white"},{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":": ","color":"white"},{"text": "failed to load","color":"red"}]


