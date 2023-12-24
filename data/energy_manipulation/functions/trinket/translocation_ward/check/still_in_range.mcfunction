$execute as $(uuid) if entity @s[distance=..32] store success score #xem.trinket.translocation_ward.still_in_range xem.op run return 1
scoreboard players set #xem.trinket.translocation_ward.still_in_range xem.op 0
return 0
