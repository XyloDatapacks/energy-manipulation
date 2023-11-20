# -> {uuid, caster_uuid}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

# sound
$execute at $(uuid) run playsound energy_manipulation:spell.effect.fire player @a ~ ~ ~ 0.6 1

# dmg
$damage $(uuid) $(spell_power_dmg) minecraft:indirect_magic by $(caster_uuid)

#==<Validation Exit>==#
execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return 0
execute if score #xem.spell.run.effect.validate_target xem.op matches -1 run return 0
#=====================#

# fire
$execute as $(uuid) run data modify entity @s Fire set value $(spell_power)s
# player fire
$execute as $(uuid) if entity @s[type=minecraft:player] at @s run function energy_manipulation:spell/run/effect/fire/lit

