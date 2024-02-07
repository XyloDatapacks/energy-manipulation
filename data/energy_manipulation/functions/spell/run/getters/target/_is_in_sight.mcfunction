# return:
#   1: target is in sight
#   0: target not in sight

#too far
execute unless entity @s[distance=..64] run return 0
#is in view for sure
execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run return 1

# override executing
tag @e[distance=..65] add xylo_iris.executing
tag @s remove xylo_iris.executing

# try raycast eyes
data merge storage xylo_iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#xylo_iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b}
execute facing entity @s eyes run function xylo_iris:get_target
execute if entity @s[tag=xylo_iris.targeted_entity] run tag @e[distance=..65] remove xylo_iris.executing
execute if entity @s[tag=xylo_iris.targeted_entity] run return 1
scoreboard players operation #xem.spell.run.getters.target.dx xem.op = $dx xylo_iris
scoreboard players operation #xem.spell.run.getters.target.dy xem.op = $dy xylo_iris
scoreboard players operation #xem.spell.run.getters.target.dz xem.op = $dz xylo_iris

# try raycast feet
data merge storage xylo_iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#xylo_iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b}
execute facing entity @s feet run function xylo_iris:get_target
execute if entity @s[tag=xylo_iris.targeted_entity] run tag @e[distance=..65] remove xylo_iris.executing
execute if entity @s[tag=xylo_iris.targeted_entity] run return 1
scoreboard players operation #xem.spell.run.getters.target.dx1 xem.op = $dx xylo_iris
scoreboard players operation #xem.spell.run.getters.target.dy1 xem.op = $dy xylo_iris
scoreboard players operation #xem.spell.run.getters.target.dz1 xem.op = $dz xylo_iris

# try raycast middle body
scoreboard players operation $override_dx xylo_iris = #xem.spell.run.getters.target.dx xem.op
scoreboard players operation $override_dy xylo_iris = #xem.spell.run.getters.target.dy xem.op
scoreboard players operation $override_dz xylo_iris = #xem.spell.run.getters.target.dz xem.op
scoreboard players operation $override_dx xylo_iris += #xem.spell.run.getters.target.dx1 xem.op
scoreboard players operation $override_dy xylo_iris += #xem.spell.run.getters.target.dy1 xem.op
scoreboard players operation $override_dz xylo_iris += #xem.spell.run.getters.target.dz1 xem.op
scoreboard players operation $override_dx xylo_iris /= #2 xconst
scoreboard players operation $override_dy xylo_iris /= #2 xconst
scoreboard players operation $override_dz xylo_iris /= #2 xconst
data merge storage xylo_iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#xylo_iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b,OverrideRotation:1b}
execute facing entity @s feet run function xylo_iris:get_target
execute if entity @s[tag=xylo_iris.targeted_entity] run tag @e[distance=..65] remove xylo_iris.executing
execute if entity @s[tag=xylo_iris.targeted_entity] run return 1

# failed
tag @e[distance=..65] remove xylo_iris.executing
return 0