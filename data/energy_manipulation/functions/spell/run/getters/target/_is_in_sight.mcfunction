scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 0

#too far
execute unless entity @s[distance=..64] run return 0
#is in view for sure
execute store success score #xem.spell.run.getters.target._is_in_sight xem.op positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run return 1

tag @e[distance=..65] add retina.executing
tag @s remove retina.executing

#try raycast
scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 1
data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:64,TargetEntities:true,OverrideExecutingEntity:true}
execute facing entity @s eyes run function xylo_retina:traverse/setup_no_entity
execute if entity @s[tag=retina.target] run tag @e[distance=..65] remove retina.executing
execute if entity @s[tag=retina.target] run return 1
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.angle_1 xem.op = $input_pitch retina.__variable__
data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:64,TargetEntities:true,OverrideExecutingEntity:true}
execute facing entity @s feet run function xylo_retina:traverse/setup_no_entity
execute if entity @s[tag=retina.target] run tag @e[distance=..65] remove retina.executing
execute if entity @s[tag=retina.target] run return 1
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op = $input_pitch retina.__variable__

scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op = #xem.spell.run.getters.target._is_in_sight.angle_1 xem.op
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op -= #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op /= #2 xconst
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op += #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op
scoreboard players operation $override_pitch retina.__variable__ = #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op
data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:64,TargetEntities:true,OverrideExecutingEntity:true}
execute facing entity @s feet run function xylo_retina:traverse/setup_no_entity
execute if entity @s[tag=retina.target] run tag @e[distance=..65] remove retina.executing
execute if entity @s[tag=retina.target] run return 1

scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 0
return 0