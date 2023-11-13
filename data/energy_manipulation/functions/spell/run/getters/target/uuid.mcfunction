# -> {sort, min_distance, max_distance, selection, selector}

# $tellraw @a[tag=xem.debug] "execute positioned $(initial_position_x) $(initial_position_y) $(initial_position_z) as $(selector)] ,distance=$(min_distance)..$(max_distance),sort=$(sort)$(selection)]"
$execute in $(dimension) positioned $(initial_position_x) $(initial_position_y) $(initial_position_z) as $(selector),tag=!smithed.block,tag=!xlib.non_interactive,tag=!xem.spell.non_selectable,distance=$(min_distance)..$(max_distance),predicate=!energy_manipulation:spell/run/getters/target/undetectable,predicate=energy_manipulation:spell/run/getters/target/feature/$(feature),sort=$(sort)$(selection)] run function energy_manipulation:spell/run/getters/target/uuid2
