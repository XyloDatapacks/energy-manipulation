# <@> entity which might have some reroute active.
# checks whether this entity can be selected or not, or if a reroute entity should be chosen instead
# has to be run in both volume check and validate_uuid (since they are the two ways a target can be chosen)

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


#==<Origin and Fallback>==#
# (reroute entities must always be couppled with their origin)

# get origin_uuid and fallback flag
execute if entity @s[tag=xem.spell.run.getters.target._reroute.entity] run function energy_manipulation:spell/run/getters/target/_reroute/get_origin_and_fallback

# debug 
execute unless score #xem.spell.run.getters.target._reroute.selector_type xem.op matches 1..2 run tellraw @a[tag=xem.debug] {"text":"Error: selector_type does not have correct value","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"energy_manipulation:spell/run/getters/target/_reroute/state"}]}}
execute unless score #xem.spell.run.getters.target._reroute.selector_type xem.op matches 1..2 store result score #xem.spell.run.getters.target._reroute.reroute_state xem.op run return -1


#==<Volume Check>==#
# (#xem.spell.run.getters.target._reroute.selector_type xem.op = 1)

# meditation
execute if score #xem.spell.run.getters.target._reroute.selector_type xem.op matches 1 if entity @s[tag=xem.mind.meditation.is_meditating] store result score #xem.spell.run.getters.target._reroute.reroute_state xem.op run return 1

# others
#...

#==<Validate UUID>==#
# (#xem.spell.run.getters.target._reroute.selector_type xem.op = 2)

# meditation
execute if score #xem.spell.run.getters.target._reroute.selector_type xem.op matches 2 if entity @s[tag=xem.mind.meditation.is_meditating] run function energy_manipulation:spell/run/getters/target/_reroute/type/expanded_mind/is_expanding_override with storage energy_manipulation:op target_out[-1]
execute if score #xem.spell.run.getters.target._reroute.selector_type xem.op matches 2 if entity @s[tag=xem.mind.meditation.is_meditating] store result score #xem.spell.run.getters.target._reroute.reroute_state xem.op run return 2

# others
#...


#==<Nothing Got Selected>==#
# if it reaches here, then there is no reroute going on

scoreboard players set #xem.spell.run.getters.target._reroute.reroute_state xem.op 0
return 0
