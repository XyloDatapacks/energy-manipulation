# -> {uuid, caster_uuid, spell_power}

# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.break player @a ~ ~ ~

# damage
$damage $(uuid) $(spell_power) minecraft:indirect_magic by $(caster_uuid)

# validate target
# $execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
# execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0


