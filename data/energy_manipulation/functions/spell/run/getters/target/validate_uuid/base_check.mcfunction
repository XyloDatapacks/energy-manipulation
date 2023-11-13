# -> {uuid}

$execute as $(uuid) if entity @s[tag=!smithed.block,tag=!xlib.non_interactive,tag=!xem.spell.non_selectable,predicate=energy_manipulation:spell/run/getters/target/feature/$(feature)] run scoreboard players set xem.spell.run.getters.target.found xem.op 1

