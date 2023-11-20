#-> {uuid, spell_power}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.light player @a ~ ~ ~ 0.3 1

#==<Validation Exit>==#
execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0
execute if score #xem.spell.run.effect.validate_target xem.op matches ..-1 run return 0
#=====================#

# effect
$execute as $(uuid) run effect give @s minecraft:glowing $(spell_power) 0 true

