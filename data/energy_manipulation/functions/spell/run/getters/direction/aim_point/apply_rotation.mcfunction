execute unless score #xem.spell.run.getters.direction.aim_point.loop xem.op matches 1.. run return 0
scoreboard players set #xem.spell.run.getters.direction.aim_point.loop xem.op 0

# set direction
execute summon minecraft:marker run function energy_manipulation:spell/run/getters/direction/aim_point/xlm.get_rotation
