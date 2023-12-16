# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------


execute store success score #xem.trinket.scrying_ward.track xem.op if data storage xylo_items:op register_item_inventory[{tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:1b}}}]
execute if score #xem.trinket.scrying_ward.track xem.op matches 1 run tag @s add xem.trinket.scrying_ward
execute if score #xem.trinket.scrying_ward.track xem.op matches 0 run tag @s remove xem.trinket.scrying_ward



