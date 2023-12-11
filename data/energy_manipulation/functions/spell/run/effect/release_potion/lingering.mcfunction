# sound
playsound energy_manipulation:spell.effect.release_potion player @a ~ ~ ~ 1 1

# get potion and remove duration (returns "energy_manipulation:op potion_effects")
$execute as $(caster_uuid) run function energy_manipulation:spell/run/effect/release_potion/_elaborate_potion/start

# summon aoe cloud