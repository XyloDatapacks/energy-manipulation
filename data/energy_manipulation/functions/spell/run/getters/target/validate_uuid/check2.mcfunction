# -> {uuid}

#==<REROUTH==#
# if this is a player and it is supposed to be in a state, where another entity should be targeted instead -> target entity

# is_expanding so check for rerouth
$execute as $(uuid) if entity @s[type=minecraft:player,tag=xem.mind.expand.is_expanding] run function energy_manipulation:spell/run/getters/target/validate_uuid/rerouth/is_expanding_override with storage energy_manipulation:op macro_data
# other rerouth cases here...


#==<Check>==#

function energy_manipulation:spell/run/getters/target/validate_uuid/check3 with storage energy_manipulation:op macro_data