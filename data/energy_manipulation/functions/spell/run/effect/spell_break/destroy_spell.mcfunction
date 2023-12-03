# -> {uuid}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.spell_break player @a ~ ~ ~ 1 1
$execute at $(uuid) run particle minecraft:glow ~ ~ ~ 0.1 0.1 0.1 1 5 force

#==<Validation Exit>==#
execute unless score #xem.spell.run.effect.validate_target xem.op matches -1 unless score #xem.spell.run.effect.validate_target xem.op matches -3 run return 0
#=====================#

#make spell/shape fail
$execute as $(uuid) run scoreboard players remove @s xem.spell.caster_last_death_time 1

