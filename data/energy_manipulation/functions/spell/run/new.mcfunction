# in: "energy_manipulation:op spell"

# otional in: "#xem.spell.run.override_spell_data xem.op"
# > if override = 1 -> no context needed
#       in: "energy_manipulation:op spell_data"
#       in: "#xem.spell.run.init.caster_last_death_time xem.op"
# > unless override = 1 -> execute as caster
#       in: "#xem.spell.book.casting_power xem.op"

execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run function energy_manipulation:spell/run/_check_spell_per_sec/start
execute if score #xem.spell.run.override_spell_data xem.op matches 1 run function energy_manipulation:spell/run/_check_spell_per_sec/find_caster with storage energy_manipulation:op spell_data
execute unless score #xem.spell.run._check_spell_per_sec.check_passed xem.op matches 1 run function energy_manipulation:spell/run/reset_overrides
execute unless score #xem.spell.run._check_spell_per_sec.check_passed xem.op matches 1 run return 0

execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run scoreboard players operation #xem.spell.run.init.caster_last_death_time xem.op = @s xem.last_death_time
execute unless score #xem.spell.run.override_spell_data xem.op matches 1 run function xylo_library:utilities/uuid/generate
execute summon minecraft:marker run function energy_manipulation:spell/run/init