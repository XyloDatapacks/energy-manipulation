# -> {uuid}

$execute as $(uuid) if entity @s[tag=!smithed.block,tag=!xlib.non_interactive,tag=!xem.spell.non_selectable,predicate=!energy_manipulation:spell/run/getters/target/spectator_player,predicate=energy_manipulation:spell/run/getters/target/feature/$(feature)] run scoreboard players set xem.spell.run.getters.target.found xem.op 1

#trinket
$execute if score xem.spell.run.getters.target.found xem.op matches 1 as $(uuid) if entity @s[tag=xem.trinket.scrying_ward] run function energy_manipulation:trinket/scrying_ward/deselect

