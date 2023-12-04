# init value so that if caster is not found the output is still 1 (example: player left the server)
scoreboard players set #xem.spell.run.caster_still_alive xem.op 1
# check if time are the same
scoreboard players operation #xem.spell.run._check_caster_death.spell_value xem.op = @s xem.spell.caster_last_death_time
$execute as $(caster) store success score #xem.spell.run.caster_still_alive xem.op if score #xem.spell.run._check_caster_death.spell_value xem.op = @s xem.last_death_time


#turrets count
$execute if entity @s[tag=xem.spell.turret_type] as $(caster) run scoreboard players add @s xem.spell.turrets_in_shape_tick 1