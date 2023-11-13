ride @s dismount
tag @s remove xem.spell.run.effect.pull

scoreboard players operation $x delta.api.launch = @s xem.spell.run.effect.pull.motion.x
scoreboard players operation $y delta.api.launch = @s xem.spell.run.effect.pull.motion.y
scoreboard players operation $z delta.api.launch = @s xem.spell.run.effect.pull.motion.z

scoreboard players operation $x delta.api.launch *= #10 xconst
scoreboard players operation $y delta.api.launch *= #10 xconst
scoreboard players operation $z delta.api.launch *= #10 xconst

function delta:api/launch_xyz