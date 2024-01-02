# generic spell data
data modify storage energy_manipulation:op turret_type_condition_data set from entity @s {}
data modify storage energy_manipulation:op initial_position set from storage energy_manipulation:op turret_type_condition_data.Pos
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op turret_type_condition_data.Rotation
data modify storage energy_manipulation:op running_spell_data set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.spell_data

# test condition
data modify storage energy_manipulation:op condition_in set from storage energy_manipulation:op turret_type_condition_data.data.energy_manipulation.shape.condition
function energy_manipulation:spell/run/getters/condition/get
execute unless score xem.spell.run.getters.condition.passed xem.op matches 1 run tag @s remove xem.spell.turret_type.cond.target_found
execute if score xem.spell.run.getters.condition.passed xem.op matches 1 if entity @s[tag=xem.spell.turret_type.cond.target_found] run scoreboard players set xem.spell.run.getters.condition.passed xem.op 0
execute unless score xem.spell.run.getters.condition.passed xem.op matches 1 run scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.cooldown_time
execute unless score xem.spell.run.getters.condition.passed xem.op matches 1 run return 0

# setup spell to run
scoreboard players set #xem.spell.run.shape_tick.turret_type.condition.target.passed xem.op 1
execute at @s run function energy_manipulation:spell/run/shape_tick/turret_type/run_spell
scoreboard players set #xem.spell.run.shape_tick.turret_type.condition.target.passed xem.op 0

# set new activation time
execute if entity @s[tag=xem.spell.turret_type.fm.once] run scoreboard players operation @s xem.spell.shape.expire_time = #xlib.time xlib.op
execute if entity @s[tag=xem.spell.turret_type.fm.condition] run scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.cooldown_time
execute if entity @s[tag=xem.spell.turret_type.fm.condition] run tag @s add xem.spell.turret_type.cond.target_found
execute if entity @s[tag=xem.spell.turret_type.fm.repeat] run scoreboard players operation @s xem.spell.shape.activation_time += @s xem.spell.shape.fire_rate
execute if entity @s[tag=xem.spell.turret_type.fm.repeat] run tag @s remove xem.spell.turret_type.cond.target
execute if entity @s[tag=xem.spell.turret_type.fm.repeat] run tag @s add xem.spell.turret_type.cond.cooldown