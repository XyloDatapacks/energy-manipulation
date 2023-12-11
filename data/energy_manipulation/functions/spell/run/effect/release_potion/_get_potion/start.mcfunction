# <@> caster

execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"mainhand"} run data modify storage energy_manipulation:op spell_effect.potion set from entity @s SelectedItem
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"offhand"} run data modify storage energy_manipulation:op spell_effect.potion set from entity @s Inventory[{Slot:-106b}]
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"hotbar"} run scoreboard players add #xem.spell.run.effect.release_potion.get_potion.slot xem.op 0
execute if data storage energy_manipulation:op spell_effect.effect.slot{value:"inventory"} run scoreboard players add #xem.spell.run.effect.release_potion.get_potion.slot xem.op 9
execute unless score #xem.spell.run.effect.release_potion.get_potion.slot xem.op matches 0.. run return 0

execute if score #xem.spell.run.effect.release_potion.get_potion.slot xem.op matches 0 store result score #xem.spell.run.effect.release_potion.get_potion.slot_base xem.op run data get storage energy_manipulation:op spell_effect.effect.slot.hotbar_index
execute if score #xem.spell.run.effect.release_potion.get_potion.slot xem.op matches 9 store result score #xem.spell.run.effect.release_potion.get_potion.slot_base xem.op run data get storage energy_manipulation:op spell_effect.effect.slot.inv_index
data remove storage energy_manipulation:op macro_data
execute store result storage energy_manipulation:op macro_data.slot int 1 run scoreboard players operation #xem.spell.run.effect.release_potion.get_potion.slot xem.op += #xem.spell.run.effect.release_potion.get_potion.slot_base xem.op
function energy_manipulation:spell/run/effect/release_potion/_get_potion/from_slot with storage energy_manipulation:op macro_data
scoreboard players reset #xem.spell.run.effect.release_potion.get_potion.slot xem.op