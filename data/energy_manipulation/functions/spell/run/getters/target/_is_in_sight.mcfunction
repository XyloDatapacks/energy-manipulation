scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 0
execute unless entity @s[distance=..64] run return 0

data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:100,TargetEntities:true,MaxTravelDistance:64}

scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 1
execute facing entity @s eyes run function xylo_retina:traverse/setup
execute if entity @s[tag=retina.target] run return 1
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.angle_1 xem.op = $input_pitch retina.__variable__
execute facing entity @s feet run function xylo_retina:traverse/setup
execute if entity @s[tag=retina.target] run return 1
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op = $input_pitch retina.__variable__

scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op = #xem.spell.run.getters.target._is_in_sight.angle_1 xem.op
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op -= #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op /= #2 xconst
scoreboard players operation #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op += #xem.spell.run.getters.target._is_in_sight.angle_2 xem.op
scoreboard players operation $override_input_pitch retina.__variable__ = #xem.spell.run.getters.target._is_in_sight.center_body_pitch xem.op
execute facing entity @s feet run function xylo_retina:traverse/setup
execute if entity @s[tag=retina.target] run return 1

scoreboard players set #xem.spell.run.getters.target._is_in_sight xem.op 0
return 0