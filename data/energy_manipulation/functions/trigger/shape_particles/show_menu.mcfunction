tellraw @s {"text":"\n=================================\n"}

tellraw @s[tag=!xem.spell.disable_particles.projectile] [{"translate": "settings.energy_manipulation.shape_particles.projectile"},": ",{"translate": "settings.energy_manipulation.shape_particles.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -2"}}] 
tellraw @s[tag=xem.spell.disable_particles.projectile] [{"translate": "settings.energy_manipulation.shape_particles.projectile"},": ",{"translate": "settings.energy_manipulation.shape_particles.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -1"}}] 

tellraw @s[tag=!xem.spell.disable_particles.dart] [{"translate": "settings.energy_manipulation.shape_particles.dart"},": ",{"translate": "settings.energy_manipulation.shape_particles.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -4"}}] 
tellraw @s[tag=xem.spell.disable_particles.dart] [{"translate": "settings.energy_manipulation.shape_particles.dart"},": ",{"translate": "settings.energy_manipulation.shape_particles.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -3"}}] 

tellraw @s[tag=!xem.spell.disable_particles.sprout] [{"translate": "settings.energy_manipulation.shape_particles.sprout"},": ",{"translate": "settings.energy_manipulation.shape_particles.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -6"}}] 
tellraw @s[tag=xem.spell.disable_particles.sprout] [{"translate": "settings.energy_manipulation.shape_particles.sprout"},": ",{"translate": "settings.energy_manipulation.shape_particles.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -5"}}] 

tellraw @s[tag=!xem.spell.disable_particles.aoe] [{"translate": "settings.energy_manipulation.shape_particles.aoe"},": ",{"translate": "settings.energy_manipulation.shape_particles.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -8"}}] 
tellraw @s[tag=xem.spell.disable_particles.aoe] [{"translate": "settings.energy_manipulation.shape_particles.aoe"},": ",{"translate": "settings.energy_manipulation.shape_particles.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -7"}}] 

tellraw @s[tag=!xem.spell.disable_particles.turret] [{"translate": "settings.energy_manipulation.shape_particles.turret"},": ",{"translate": "settings.energy_manipulation.shape_particles.active","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -10"}}] 
tellraw @s[tag=xem.spell.disable_particles.turret] [{"translate": "settings.energy_manipulation.shape_particles.turret"},": ",{"translate": "settings.energy_manipulation.shape_particles.inactive","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s xem.settings.shape_particles -9"}}] 

tellraw @s {"text":"\n=================================\n"}

scoreboard players set @s xem.settings.shape_particles 0

