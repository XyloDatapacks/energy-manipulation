# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.light player @a ~ ~ ~ 0.3 1

# validate target
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0

# effect
$execute as $(uuid) run effect give @s minecraft:glowing $(spell_power) 0 true

