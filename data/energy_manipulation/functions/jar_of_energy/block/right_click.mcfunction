# advancement reward function
advancement revoke @s only energy_manipulation:jar_of_energy/block/right_click
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

#place jar on jar
#execute store success score #xem.jar_of_energy.block.right_click.place_jar xem.op if predicate energy_manipulation:jar_of_energy/holding/generic_energy_mh
#execute if score #xem.jar_of_energy.block.right_click.place_jar xem.op matches 1 run function energy_manipulation:jar_of_energy/place/start
#execute if score #xem.jar_of_energy.block.right_click.place_jar xem.op matches 1 run return 0

#fill / empty
execute unless predicate xylo_library:is_sneaking if predicate energy_manipulation:energy/holding/generic_energy_mh run function energy_manipulation:jar_of_energy/block/fill/find
execute if predicate xylo_library:is_sneaking run function energy_manipulation:jar_of_energy/block/withdraw/find

