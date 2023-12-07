#secondary display
execute on vehicle on passengers run scoreboard players operation #xem.spell.run.shape_tick.aoe_type.expand_size xem.op = @s[tag=xem.spell.shape_display.aoe.big] xem.spell.run.shape.aoe.size
data modify storage energy_manipulation:op temp_compound set value {left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.6f,0.6f,0.6f],translation:[0.0f,0.0f,0.0f]}
execute store result storage energy_manipulation:op temp_compound.scale[0] float 2 run scoreboard players get #xem.spell.run.shape_tick.aoe_type.expand_size xem.op
execute store result storage energy_manipulation:op temp_compound.scale[1] float 2 run scoreboard players get #xem.spell.run.shape_tick.aoe_type.expand_size xem.op
execute store result storage energy_manipulation:op temp_compound.scale[2] float 2 run scoreboard players get #xem.spell.run.shape_tick.aoe_type.expand_size xem.op
execute on vehicle on passengers run data modify entity @s[tag=xem.spell.shape_display.aoe.big] transformation set from storage energy_manipulation:op temp_compound
tag @s remove xem.spell.run.shape.aoe.expand
