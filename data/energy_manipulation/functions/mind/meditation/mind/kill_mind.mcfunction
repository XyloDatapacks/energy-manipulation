execute on vehicle run kill @s
kill @s
$item replace entity $(horse_uuid) horse.saddle with minecraft:air
$kill $(horse_uuid)
$kill $(shulker_uuid)

$execute as $(owner_uuid) run function energy_manipulation:mind/meditation/exit/start