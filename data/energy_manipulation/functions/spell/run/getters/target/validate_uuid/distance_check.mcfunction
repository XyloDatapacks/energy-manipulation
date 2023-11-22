# -> {uuid, min_distance, max_distance, dimension, initial_position_x, initial_position_y, initial_position_z}

$execute in $(dimension) positioned 0.0 0.0 0.0 positioned ~$(initial_position_x) ~$(initial_position_y) ~$(initial_position_z) as $(uuid) if entity @s[distance=$(min_distance)..$(max_distance),tag=!smithed.block,tag=!xlib.non_interactive,tag=!xem.spell.non_selectable,predicate=!energy_manipulation:spell/run/getters/target/spectator_player,predicate=energy_manipulation:spell/run/getters/target/feature/$(feature)] run scoreboard players set xem.spell.run.getters.target.found xem.op 1
