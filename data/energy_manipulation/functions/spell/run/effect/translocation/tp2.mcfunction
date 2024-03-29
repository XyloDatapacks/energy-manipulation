# -> {uuid, position_x, position_y, position_z}

#==<Validate Target>==#
$execute as $(uuid) store result score #xem.spell.run.effect.validate_target xem.op run function energy_manipulation:spell/run/effect/validate_target
#=====================#

#==<Validation Exit>==#
$execute if score #xem.spell.run.effect.validate_target xem.op matches 1.. run return run execute at $(uuid) run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~
$execute if score #xem.spell.run.effect.validate_target xem.op matches -2..-1 run return run execute at $(uuid) run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~

#=====================#


#==<Other Exit Checks>==#
#check dimension tp
$execute unless score #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op matches 1 at $(uuid) store success score #xem.spell.run.effect.translocation.is_inter_dimensional_tp xem.op unless dimension $(dimension)
execute unless score #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op matches 1 if score #xem.spell.run.effect.translocation.is_inter_dimensional_tp xem.op matches 1 run return run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~

#check max tp distance
$execute if score #xem.spell.run.effect.translocation.max_range xem.op matches 0.. at $(uuid) summon minecraft:marker run function energy_manipulation:spell/run/effect/translocation/distance
$execute if score #xem.spell.run.effect.translocation.max_range xem.op matches 0.. if score #xem.spell.run.effect.translocation.distance xem.op > #xem.spell.run.effect.translocation.max_range xem.op run return run execute at $(uuid) run playsound energy_manipulation:spell.effect.translocation player @a ~ ~ ~

#=======================#

# tp
$execute in $(dimension) as $(uuid) positioned 0.0 0.0 0.0 positioned ~$(position_x) ~$(position_y) ~$(position_z) run function energy_manipulation:spell/run/effect/translocation/tp_execute