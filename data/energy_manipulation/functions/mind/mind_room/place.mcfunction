$say  $(x) 0 $(y)

$execute if block $(x) 0 $(y) minecraft:stone run scoreboard players add errors xem.test 1
$setblock $(x) 0 $(y) stone

$particle dust 1 0 0 1 $(x) 1 $(y) 0.0 0.0 0.0 1 3

