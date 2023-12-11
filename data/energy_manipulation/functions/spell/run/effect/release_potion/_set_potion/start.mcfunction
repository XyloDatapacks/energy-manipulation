# <@> caster

data remove storage energy_manipulation:op macro_data
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"mainhand"} run data modify storage energy_manipulation:op macro_data set value {pre:"weapon",post:"mainhand"}
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"offhand"} run data modify storage energy_manipulation:op macro_data set value {pre:"weapon",post:"offhand"}
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"hotbar"} run data modify storage energy_manipulation:op macro_data set value {pre:"hotbar"}
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"hotbar"} run data modify storage energy_manipulation:op macro_data.post set from storage energy_manipulation:op spell_effect.effect.slot.hotbar_index
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"inventory"} run data modify storage energy_manipulation:op macro_data set value {pre:"inventory"}
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"inventory"} run data modify storage energy_manipulation:op macro_data.post set from storage energy_manipulation:op spell_effect.effect.slot.inv_index

function energy_manipulation:spell/run/effect/release_potion/_set_potion/from_slot with storage energy_manipulation:op macro_data
