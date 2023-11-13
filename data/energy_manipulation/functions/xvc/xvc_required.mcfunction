function energy_manipulation:xvc/xvc_load

execute if score $energy_manipulation xvc.load_status matches 0 run return -1
execute unless score #energy_manipulation xvc.version >= #energy_manipulation xvc.min_version_required run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "energy_manipulation not up to date","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #energy_manipulation xvc.version >= #energy_manipulation xvc.min_version_required run return -1
return 1
