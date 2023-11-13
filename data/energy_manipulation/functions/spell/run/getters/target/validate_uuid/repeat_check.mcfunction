# in: "energy_manipulation:op validate_uuid"

# out: "xem.spell.run.getters.target.found xem.op"

# get uuid
data modify storage energy_manipulation:op macro_data.uuid set from storage energy_manipulation:op validate_uuid
scoreboard players set xem.spell.run.getters.target.found xem.op 0
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/distance_check with storage energy_manipulation:op macro_data
execute unless score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/base_check with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 1 run function energy_manipulation:spell/run/getters/target/validate_uuid/distance_check_no_tags with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.getters.target.validate_uuid.skip_tags xem.op matches 1 if score #xem.spell.run.getters.target.validate_uuid.distance_check xem.op matches 0 run function energy_manipulation:spell/run/getters/target/validate_uuid/base_check_no_tags with storage energy_manipulation:op macro_data