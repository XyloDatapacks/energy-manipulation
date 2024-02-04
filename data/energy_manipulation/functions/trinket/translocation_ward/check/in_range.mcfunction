# return:
#   1: found entity in range and got uuid
#   fail: entity not found

data remove storage energy_manipulation:op translocation_ward_uuid
execute as @e[type=minecraft:item_display,distance=..32,tag=xem.trinket.translocation_ward.ward,sort=nearest,limit=1] run return run function energy_manipulation:trinket/translocation_ward/check/get_uuid
return fail