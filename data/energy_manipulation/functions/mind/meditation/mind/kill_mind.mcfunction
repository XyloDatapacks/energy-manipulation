execute on vehicle on vehicle run kill @s
execute on vehicle run kill @s

$item replace entity $(horse_uuid) horse.saddle with minecraft:air
$kill $(horse_uuid)
$kill $(shulker_uuid)

$execute if score #xem.mind.meditation.mind.player_end_time xem.op = @s xem.mind.meditation.end_time as $(owner_uuid) if entity @s[tag=xem.mind.expand.is_expanding] run function energy_manipulation:mind/meditation/exit/start

kill @s