# -> {uuid} (from energy_manipulation:op translocation_ward_uuid)
# as entitry 

playsound energy_manipulation:trinket.translocation_ward.block_tp player @a ~ ~ ~ 1 1

scoreboard players set #xem.trinket.translocation_ward.anchor_fx.loop xem.op 0
$execute at @s anchored eyes positioned ^ ^ ^ as $(uuid) facing entity @s eyes run function energy_manipulation:trinket/translocation_ward/anchor_fx/loop