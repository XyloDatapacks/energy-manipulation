execute if score @s xem.settings.shape_particles matches -1 run tag @s remove xem.spell.disable_particles.projectile
execute if score @s xem.settings.shape_particles matches -2 run tag @s add xem.spell.disable_particles.projectile

execute if score @s xem.settings.shape_particles matches -3 run tag @s remove xem.spell.disable_particles.sprout
execute if score @s xem.settings.shape_particles matches -4 run tag @s add xem.spell.disable_particles.sprout

execute if score @s xem.settings.shape_particles matches -5 run tag @s remove xem.spell.disable_particles.aoe
execute if score @s xem.settings.shape_particles matches -6 run tag @s add xem.spell.disable_particles.aoe

execute if score @s xem.settings.shape_particles matches -7 run tag @s remove xem.spell.disable_particles.turret
execute if score @s xem.settings.shape_particles matches -8 run tag @s add xem.spell.disable_particles.turret

function energy_manipulation:trigger/shape_particles/show_menu