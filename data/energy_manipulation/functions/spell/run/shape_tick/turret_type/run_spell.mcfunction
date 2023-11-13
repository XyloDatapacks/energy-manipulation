# at @s

# activate override
scoreboard players set #xem.spell.run.override_spell_data xem.op 1
# override spell data
data modify storage energy_manipulation:op spell_data set from entity @s data.energy_manipulation.spell_data
# override cast last death time
scoreboard players operation #xem.spell.run.init.caster_last_death_time xem.op = @s xem.caster_last_death_time

# override concatenate index
scoreboard players operation #xem.spell.run.override_concatenate_index xem.op = @s xem.spell.run.elaborate.concatenate_index

# get spell
data modify storage energy_manipulation:op spell set from entity @s data.energy_manipulation.spell
# activate spell
function energy_manipulation:spell/run/new


# sound
playsound energy_manipulation:spell.cast player @a ~ ~ ~ 3.0 1