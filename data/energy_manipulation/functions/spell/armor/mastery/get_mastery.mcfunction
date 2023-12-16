# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

scoreboard players set @s xem.spell.armor.mastery.generic 0
scoreboard players set @s xem.spell.armor.mastery.sun 0
scoreboard players set @s xem.spell.armor.mastery.ground 0
scoreboard players set @s xem.spell.armor.mastery.soul 0
scoreboard players set @s xem.spell.armor.mastery.dark 0
scoreboard players set @s xem.spell.armor.mastery.void 0
function energy_manipulation:spell/armor/mastery/save_mastery with storage xylo_items:op register_item_inventory[{Slot:100b,tag:{energy_manipulation:{mastery:{}}}}].tag.energy_manipulation.mastery
function energy_manipulation:spell/armor/mastery/save_mastery with storage xylo_items:op register_item_inventory[{Slot:101b,tag:{energy_manipulation:{mastery:{}}}}].tag.energy_manipulation.mastery
function energy_manipulation:spell/armor/mastery/save_mastery with storage xylo_items:op register_item_inventory[{Slot:102b,tag:{energy_manipulation:{mastery:{}}}}].tag.energy_manipulation.mastery
function energy_manipulation:spell/armor/mastery/save_mastery with storage xylo_items:op register_item_inventory[{Slot:103b,tag:{energy_manipulation:{mastery:{}}}}].tag.energy_manipulation.mastery

