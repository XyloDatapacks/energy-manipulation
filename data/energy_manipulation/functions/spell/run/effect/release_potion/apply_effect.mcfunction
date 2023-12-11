# -> {uuid, caster_uuid}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.release_potion player @a ~ ~ ~ 1 1

#==<Validation Exit>==#
execute unless score #xem.spell.run.effect.validate_target xem.op matches 0 run return 0
#=====================#


# get potion and remove duration (returns "energy_manipulation:op potion_effects")
$execute as $(caster_uuid) run function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/start

#apply effect for player

#apply effect for mob
