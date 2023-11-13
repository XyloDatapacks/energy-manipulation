tag @s remove xem.jar_of_energy.block_new
$tag @s add xem.jar_of_energy.$(type)

data modify entity @s item set from storage energy_manipulation:op jar
execute store result score @s xem.jar_of_energy.energy_count run data get storage energy_manipulation:op jar.tag.energy_manipulation.energy_count

#energy count display
function energy_manipulation:jar_of_energy/block/jar_display
