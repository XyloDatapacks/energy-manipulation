execute store success score #xem.gui.has_book xem.op if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id_tags:["energy_manipulation:spell_book"]}}}
execute if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id_tags:["energy_manipulation:spell_book"]}}} run scoreboard players set #xem.gui.has_book xem.op 1

#get casting fatigue
scoreboard players operation #xem.gui.casting_fatigue xem.op = @s xem.spell.casting_fatigue.percentage
scoreboard players operation #xem.gui.casting_fatigue xem.op *= #90 xconst
scoreboard players operation #xem.gui.casting_fatigue xem.op /= #100 xconst
execute store result storage energy_manipulation:op gui.casting_fatigue int 1 run scoreboard players operation #xem.gui.casting_fatigue xem.op < #90 xconst
#get raw energy
scoreboard players operation #xem.gui.raw_energy xem.op = @s xem.spell.raw_energy
scoreboard players operation #xem.gui.raw_energy xem.op *= #90 xconst
scoreboard players operation #xem.gui.raw_energy xem.op /= #xem.spell.raw_energy.max xem.op
execute store result storage energy_manipulation:op gui.raw_energy int 1 run scoreboard players operation #xem.gui.raw_energy xem.op < #90 xconst
#get focus
scoreboard players operation #xem.gui.focus xem.op = @s xem.mind.focus
scoreboard players operation #xem.gui.focus xem.op /= #20 xconst
scoreboard players operation #xem.gui.focus xem.op *= #90 xconst
scoreboard players operation #xem.gui.focus xem.op /= #100 xconst
execute store result storage energy_manipulation:op gui.focus int 1 run scoreboard players operation #xem.gui.focus xem.op < #90 xconst

function energy_manipulation:gui/print with storage energy_manipulation:op gui