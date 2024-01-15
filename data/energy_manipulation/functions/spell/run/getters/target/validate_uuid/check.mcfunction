# -> {uuid}
# out: "xem.spell.run.getters.target.found xem.op"

$execute as $(uuid) if entity @s[type=minecraft:player,tag=xem.mind.expand.is_expanding] run function energy_manipulation:spell/run/getters/target/validate_uuid/is_expanding_override with storage energy_manipulation:op macro_data
$execute as $(uuid) if entity @s[type=minecraft:player,tag=xem.mind.expand.is_expanding] run return 1

scoreboard players set xem.spell.run.getters.target.found xem.op 0
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/check/distance_check with storage energy_manipulation:op macro_data
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/check/base_check with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/check/distance_check_no_tags with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/check/base_check_no_tags with storage energy_manipulation:op macro_data