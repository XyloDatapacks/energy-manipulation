#remove
scoreboard players operation @s xem.spell.casting_fatigue.last_spell_time < #xlib.time xlib.op
scoreboard players operation #xem.spell.casting_fatigue.delta_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.spell.casting_fatigue.delta_time xem.op -= @s xem.spell.casting_fatigue.last_spell_time
scoreboard players operation @s xem.spell.casting_fatigue.spell_rate -= #xem.spell.casting_fatigue.delta_time xem.op
scoreboard players operation @s xem.spell.casting_fatigue.spell_rate > #0 xconst
#update time
scoreboard players operation @s xem.spell.casting_fatigue.last_spell_time = #xlib.time xlib.op

#get fatigue value
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op = @s xem.spell.casting_fatigue.spell_rate
#projectile extra
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op = @s xem.spell.casting_fatigue.projectiles_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op += @s xem.spell.casting_fatigue.projectiles_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op += @s xem.spell.casting_fatigue.projectiles_casted_in_tick
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op *= #1 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.projectile_extra xem.op
#turret extra
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op = @s xem.spell.casting_fatigue.turrets_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op += @s xem.spell.casting_fatigue.turrets_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op += @s xem.spell.casting_fatigue.turrets_casted_in_tick
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op *= #5 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.turret_extra xem.op
#aoe extra
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op = @s xem.spell.casting_fatigue.aoes_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op += @s xem.spell.casting_fatigue.aoes_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op += @s xem.spell.casting_fatigue.aoes_casted_in_tick
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op *= #2 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.aoe_extra xem.op

#copy value for fatigue objective and calc percentage again
scoreboard players operation @s xem.spell.casting_fatigue.fatigue = #xem.spell.casting_fatigue.fatigue xem.op
scoreboard players operation @s xem.spell.casting_fatigue.percentage = #xem.spell.casting_fatigue.fatigue xem.op
scoreboard players operation @s xem.spell.casting_fatigue.percentage *= #100 xconst
scoreboard players operation @s xem.spell.casting_fatigue.percentage /= #xem.spell.casting_fatigue.max xem.op

