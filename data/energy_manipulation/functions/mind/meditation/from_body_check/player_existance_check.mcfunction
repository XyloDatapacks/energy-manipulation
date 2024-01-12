scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 0
$execute as $(owner_uuid) if entity @s[tag=xem.mind.expand.is_expanding] run scoreboard players set #xem.mind.meditation.from_body_check.player_found xem.op 1
execute if score #xem.mind.meditation.from_body_check.player_found xem.op matches 0 on vehicle run function energy_manipulation:mind/meditation/exit/kill
