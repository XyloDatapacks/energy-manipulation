execute unless score #xem.spell.run.getters.position.ray_trace.loop xem.op matches 1.. run return 0
scoreboard players set #xem.spell.run.getters.position.ray_trace.loop xem.op 0

# set position
execute summon minecraft:marker run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position

# tofix_cal
# execute as 545ec994-ae69-485d-9604-981ce1612a99 run function energy_manipulation:spell/run/getters/position/ray_trace/xlm.get_position
