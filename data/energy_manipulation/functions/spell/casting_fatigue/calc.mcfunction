# update max
scoreboard players operation @s xem.spell.casting_fatigue.max = @s xem.spell.casting_fatigue.max_base

#remove
scoreboard players operation @s xem.spell.casting_fatigue.last_spell_time < #xlib.time xlib.op
scoreboard players operation #xem.spell.casting_fatigue.delta_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.spell.casting_fatigue.delta_time xem.op -= @s xem.spell.casting_fatigue.last_spell_time
scoreboard players operation @s xem.spell.casting_fatigue.spell_rate -= #xem.spell.casting_fatigue.delta_time xem.op
scoreboard players operation @s xem.spell.casting_fatigue.spell_rate > #0 xconst
#update time
scoreboard players operation @s xem.spell.casting_fatigue.last_spell_time = #xlib.time xlib.op

tellraw @a[tag=xem.debug.casting_fatigue] {"text":"--------------------"}

#get fatigue value
scoreboard players set #xem.spell.casting_fatigue.fatigue xem.op 0
#projectile extra
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op = @s xem.spell.casting_fatigue.projectiles_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op += @s xem.spell.casting_fatigue.projectiles_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op += @s xem.spell.casting_fatigue.projectiles_casted_in_tick
tellraw @a[tag=xem.debug.casting_fatigue] ["projectiles: ",{"score":{"objective":"xem.op","name":"#xem.spell.casting_fatigue.projectile_extra"}}]
scoreboard players operation #xem.spell.casting_fatigue.projectile_extra xem.op *= #2 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.projectile_extra xem.op
#turret extra
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op = @s xem.spell.casting_fatigue.turrets_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op += @s xem.spell.casting_fatigue.turrets_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op += @s xem.spell.casting_fatigue.turrets_casted_in_tick
tellraw @a[tag=xem.debug.casting_fatigue] ["turrets: ",{"score":{"objective":"xem.op","name":"#xem.spell.casting_fatigue.turret_extra"}}]
scoreboard players operation #xem.spell.casting_fatigue.turret_extra xem.op *= #5 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.turret_extra xem.op
#aoe extra
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op = @s xem.spell.casting_fatigue.aoes_in_shape_tick_old
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op += @s xem.spell.casting_fatigue.aoes_casted_in_tick_old 
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op += @s xem.spell.casting_fatigue.aoes_casted_in_tick
tellraw @a[tag=xem.debug.casting_fatigue] ["aoe: ",{"score":{"objective":"xem.op","name":"#xem.spell.casting_fatigue.aoe_extra"}}]
scoreboard players operation #xem.spell.casting_fatigue.aoe_extra xem.op *= #3 xconst
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += #xem.spell.casting_fatigue.aoe_extra xem.op
#multiplier
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op *= #10 xconst
#add spell rate
scoreboard players operation #xem.spell.casting_fatigue.fatigue xem.op += @s xem.spell.casting_fatigue.spell_rate

#copy value for fatigue objective and calc percentage again
scoreboard players operation @s xem.spell.casting_fatigue.fatigue = #xem.spell.casting_fatigue.fatigue xem.op
scoreboard players operation @s xem.spell.casting_fatigue.percentage = #xem.spell.casting_fatigue.fatigue xem.op
scoreboard players operation @s xem.spell.casting_fatigue.percentage *= #100 xconst
scoreboard players operation @s xem.spell.casting_fatigue.percentage /= @s xem.spell.casting_fatigue.max

