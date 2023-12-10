# sound
playsound energy_manipulation:spell.effect.release_effect player @a ~ ~ ~ 1 1

# get potion and remove duration
$execute as $(caster_uuid) run function energy_manipulation:spell/run/effect/release_effect/get_potion/start

# summon aoe cloud