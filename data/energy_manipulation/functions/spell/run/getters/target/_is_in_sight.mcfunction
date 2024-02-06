# return:
#   1: target is in sight
#   0: target not in sight

#too far
execute unless entity @s[distance=..64] run return 0
#is in view for sure
execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run return 1

# override executing
tag @e[distance=..65] add iris.executing
tag @s remove iris.executing

# try raycast eyes
data merge storage iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b}
execute facing entity @s eyes run function iris:get_target
execute if entity @s[tag=iris.targeted_entity] run tag @e[distance=..65] remove iris.executing
execute if entity @s[tag=iris.targeted_entity] run return 1
scoreboard players operation #xem.spell.run.getters.target.dx xem.op = $dx iris
scoreboard players operation #xem.spell.run.getters.target.dy xem.op = $dy iris
scoreboard players operation #xem.spell.run.getters.target.dz xem.op = $dz iris

# try raycast feet
data merge storage iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b}
execute facing entity @s feet run function iris:get_target
execute if entity @s[tag=iris.targeted_entity] run tag @e[distance=..65] remove iris.executing
execute if entity @s[tag=iris.targeted_entity] run return 1
scoreboard players operation #xem.spell.run.getters.target.dx1 xem.op = $dx iris
scoreboard players operation #xem.spell.run.getters.target.dy1 xem.op = $dy iris
scoreboard players operation #xem.spell.run.getters.target.dz1 xem.op = $dz iris

# try raycast middle body
scoreboard players operation $override_dx iris = #xem.spell.run.getters.target.dx xem.op
scoreboard players operation $override_dy iris = #xem.spell.run.getters.target.dy xem.op
scoreboard players operation $override_dz iris = #xem.spell.run.getters.target.dz xem.op
scoreboard players operation $override_dx iris += #xem.spell.run.getters.target.dx1 xem.op
scoreboard players operation $override_dy iris += #xem.spell.run.getters.target.dy1 xem.op
scoreboard players operation $override_dz iris += #xem.spell.run.getters.target.dz1 xem.op
scoreboard players operation $override_dx iris /= #2 xconst
scoreboard players operation $override_dy iris /= #2 xconst
scoreboard players operation $override_dz iris /= #2 xconst
data merge storage iris:settings {MaxRecursionDepth:100,MaxDistance:64,Blacklist:"#iris:shape_groups/air",TargetEntities:1b,OverrideExecutingEntity:1b,OverrideRotation:1b}
execute facing entity @s feet run function iris:get_target
execute if entity @s[tag=iris.targeted_entity] run tag @e[distance=..65] remove iris.executing
execute if entity @s[tag=iris.targeted_entity] run return 1

# failed
tag @e[distance=..65] remove iris.executing
return 0