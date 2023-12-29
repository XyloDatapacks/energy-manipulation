# works cause getters always get called as the spell_marker

scoreboard players set #xem.spell.run.getters.target.got_from_uuid xem.op 1

function xylo_library:utilities/uuid/generate
data modify storage energy_manipulation:op target_out append value {}
data modify storage energy_manipulation:op target_out[-1].uuid set from storage gu:main out
scoreboard players set xem.spell.run.getters.target.found xem.op 1