function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out

# confirm entity found
scoreboard players set xem.spell.run.getters.target.found xem.op 1
