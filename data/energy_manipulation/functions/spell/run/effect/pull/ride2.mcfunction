tag @s remove xem.spell.run.effect.pull.entity_new
execute store result score @s xem.spell.run.effect.pull.ride.end_point.x run data get storage energy_manipulation:op macro_data.position_x 100
execute store result score @s xem.spell.run.effect.pull.ride.end_point.y run data get storage energy_manipulation:op macro_data.position_y 100
execute store result score @s xem.spell.run.effect.pull.ride.end_point.z run data get storage energy_manipulation:op macro_data.position_z 100
scoreboard players operation @s xem.spell.run.effect.pull.entity.expire_time = #xlib.time xlib.op
scoreboard players add @s xem.spell.run.effect.pull.entity.expire_time 10
execute store result score #xem.spell.run.effect.spell_power xem.op run data get storage energy_manipulation:op running_spell_data.spell_power
scoreboard players operation @s xem.spell.run.effect.pull.entity.expire_time += #xem.spell.run.effect.spell_power xem.op

$ride $(uuid) mount @s
$execute as $(uuid) run tag @s add xem.spell.run.effect.pull

execute unless score #xem.spell.run.effect.pull.was_riding xem.op matches 1 run tp @s ~ ~0.3866 ~

