# -> {player_hex_uuid}

$execute on vehicle run ride $(player_hex_uuid) mount @s

$execute unless score #xlib.time xlib.op < @s xem.test run scoreboard players add $(player_hex_uuid) xlib.player.sneak_time 1
scoreboard players operation @s xem.test = #xlib.time xlib.op
scoreboard players add @s xem.test 3
