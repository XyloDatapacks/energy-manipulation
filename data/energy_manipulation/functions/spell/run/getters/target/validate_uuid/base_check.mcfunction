# -> {uuid}

$execute as $(uuid) if entity @s[tag=!smithed.block,tag=!xlib.non_interactive,tag=!xem.spell.non_selectable,tag=!xem.trinket.scrying_ward,predicate=!energy_manipulation:spell/run/getters/target/spectator_player,predicate=energy_manipulation:spell/run/getters/target/feature/$(feature)] run scoreboard players set xem.spell.run.getters.target.found xem.op 1

