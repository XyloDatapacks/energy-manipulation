tp @s ~ ~ ~ ~ ~
tag @s add xem.spell.run
tag @s add smithed.entity
tag @s add smithed.strict

# pass caster last death time
scoreboard players operation @s xem.spell.caster_last_death_time = #xem.spell.run.init.caster_last_death_time xem.op

# get indexes
execute store result score @s xem.spell.run.elaborate.concatenate_index_max run data get storage energy_manipulation:op spell
execute if score #xem.spell.run.override_concatenate_index xem.op = #xem.spell.run.override_concatenate_index xem.op run scoreboard players operation @s xem.spell.run.elaborate.concatenate_index = #xem.spell.run.override_concatenate_index xem.op
scoreboard players reset #xem.spell.run.override_concatenate_index xem.op

# add name
data modify storage energy_manipulation:op new_spell_data set value {CustomName:'{"text":"xem.spell_marker"}'}
# set spell
data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell set from storage energy_manipulation:op spell
# build spell data
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data.caster_int set from storage gu:main in
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data.caster set from storage gu:main out
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run function xylo_library:utilities/get_dimension_id/get
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data.dimension set from storage xylo_library:op get_dimension_id.dimension
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data.spell_book.energy_type_id set from storage energy_manipulation:op spell_book.tag.energy_manipulation.spell_book.energy_type_id
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 store result storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data.spell_power int 1 run scoreboard players get #xem.spell.book.casting_power xem.op
scoreboard players reset #xem.spell.book.casting_power xem.op
# override spell data?
execute if score #xem.spell.run.override_spell_data xem.op matches 1 run data modify storage energy_manipulation:op new_spell_data.data.energy_manipulation.spell_data set from storage energy_manipulation:op spell_data
scoreboard players reset #xem.spell.run.override_spell_data xem.op
# copy data
data modify entity @s {} merge from storage energy_manipulation:op new_spell_data

# run
scoreboard players set #xem.spell.run.caster_still_alive xem.op 1
function energy_manipulation:spell/run/elaborate/start 