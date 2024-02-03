# -> {uuid}

# checks whether this entity can be selected or not, or if a reroute entity should be chosen instead
# has to be run in both volume check and validate_uuid (since they are the two ways a target can be chosen)

# in: "#xem.spell.run.getters.target._reroute.max_iterations xem.op"

# in: "#xem.spell.run.getters.target._reroute.selector_type xem.op"
#   context running the function
#   1 -> volume check
#   2 -> validate uuid

# in: "energy_manipulation:op target_out[-1]"

# return:
#   0 -> should get selected as normal
#   1 -> should not get selected
#   2 -> should select reroute entity
# out:
#   adjusted "energy_manipulation:op target_out[-1]" (only if selector_type = 2)
#   


#execute if score #xem.spell.run.getters.target._reroute.max_iterations xem.op matches 3 run tellraw @a[tag=xem.debug.reroute] "\n\n\n" 
#tellraw @a[tag=xem.debug.reroute] "---------------------------------------------" 
#tellraw @a[tag=xem.debug.reroute] ["target in:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].uuid","color":"yellow"}]
#tellraw @a[tag=xem.debug.reroute] ["target in origin:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].origin_uuid","color":"yellow"}]

#==<Init>==#

# init reroute state (to always have an updated state value)
scoreboard players set #xem.spell.run.getters.target._reroute.reroute_state xem.op -1

#==<Fallback>==#
# check if the entity is found.
#   if not found return
#       if has fallback, use fallback
#   else return
#   
# if there is fallback set reroute state to 2 (so to apply reroute check to that entity)


# check if entity exist
$execute store success score #xem.spell.run.getters.target.validate_uuid.exists xem.op if entity $(uuid)
# if it does not exist and has no fallback, then return false
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 unless data storage energy_manipulation:op target_out[-1].fallback run return 0
# if it fallback then pass fallback_uuid as new target uuid
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run data modify storage energy_manipulation:op target_out[-1].uuid set from storage energy_manipulation:op target_out[-1].origin_uuid
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run data remove storage energy_manipulation:op target_out[-1].origin_uuid
execute if score #xem.spell.run.getters.target.validate_uuid.exists xem.op matches 0 run scoreboard players set #xem.spell.run.getters.target._reroute.reroute_state xem.op 2

#tellraw @a[tag=xem.debug.reroute] ["post fallback target:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].uuid","color":"gold"}]
#tellraw @a[tag=xem.debug.reroute] ["post fallback target origin:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].origin_uuid","color":"gold"}]

#==<Reroute>==#
# if state is 1, stop here cause entity cannot be targeted and no other entity has to be targeted
# state 1 is the only option that will make the target found flag false

# check reroute 
$execute as $(uuid) run function energy_manipulation:spell/run/getters/target/_reroute/reroute
execute if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 1 run return 0

#tellraw @a[tag=xem.debug.reroute] ["post reroute target:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].uuid","color":"green"}]
#tellraw @a[tag=xem.debug.reroute] ["post reroute target origin:\n",{"storage":"energy_manipulation:op","nbt":"target_out[-1].origin_uuid","color":"green"}]

#==<Check>==#
# if state = 2 then repeat check, since the uuid has changed to a new entity

scoreboard players remove #xem.spell.run.getters.target._reroute.max_iterations xem.op 1
execute if score #xem.spell.run.getters.target._reroute.max_iterations xem.op matches 1.. if score #xem.spell.run.getters.target._reroute.reroute_state xem.op matches 2 run function energy_manipulation:spell/run/getters/target/_reroute/check with storage energy_manipulation:op target_out[-1]