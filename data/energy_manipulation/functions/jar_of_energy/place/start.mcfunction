tag @s add xem.jar_of_energy.place.player
scoreboard players set #xem.jar_of_energy.place.temp.loop xem.op 50
scoreboard players set #xem.jar_of_energy.place.temp.loop.smithed_block xem.op 0
execute at @s anchored eyes positioned ^ ^ ^ if block ^ ^ ^ #xylo_library:air_like run function energy_manipulation:jar_of_energy/place/loop
tag @s remove xem.jar_of_energy.place.player
