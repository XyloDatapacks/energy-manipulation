function energy_manipulation:xvc/xvc_load

execute unless score #energy_manipulation xvc.version >= #energy_manipulation xvc.min_version_supported run tellraw @a ["",{"storage":"xvc_version:op","nbt":"datapack_name","color":"aqua"},{"text":" > ","color":"white"},{"storage":"xvc_version:op","nbt":"namespace","color":"aqua"},{"text":": ","color":"white"},{"text": "energy_manipulation not supported","color":"red","hoverEvent":{"action":"show_text","contents":["Please Update ",{"storage":"xvc_version:op","nbt":"datapack_name_error","color":"aqua"}]}}]
execute unless score #energy_manipulation xvc.version >= #energy_manipulation xvc.min_version_supported run scoreboard players set $energy_manipulation xvc.load_status 0
return 1
