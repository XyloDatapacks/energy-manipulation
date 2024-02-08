# <@> item display

# particles
function energy_manipulation:trinket/translocation_ward/fx/start

#drop check
scoreboard players set #xem.trinket.translocation_ward.drop.check xem.op 0
execute on passengers on attacker run scoreboard players set #xem.trinket.translocation_ward.drop.check xem.op 1
execute if score #xem.trinket.translocation_ward.drop.check xem.op matches 0 run return 0

loot spawn ~ ~ ~ loot energy_manipulation:give/trinket/translocation_ward/translocation_ward
playsound energy_manipulation:trinket.translocation_ward.break player @a ~ ~ ~ 1 1
execute on vehicle run kill @s
tp @s ~ -1000 ~
execute on passengers run kill @s
kill @s

