# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

# on respawn reset sb used to mark cost as not paid when dead
scoreboard players reset @s[scores={xlib.player.reapawn_status=1}] xem.spell.cost.died

# reset book casting on death/respawn
scoreboard players reset @s[scores={xem.spell.cost.died=1..}] xem.spell.book.casting_time
execute if entity @s[scores={xlib.player.reapawn_status=1}] run function energy_manipulation:spell/book/moved_book

# update last death time on death
scoreboard players operation @s[scores={xem.spell.cost.died=1..}] xem.last_death_time = #xlib.time xlib.op

# spell cost (since exhaustion is capped at 40)
scoreboard players reset @s[scores={xem.spell.cost.died=1..}] xem.spell.cost.withering.total_saturation_to_pay
scoreboard players reset @s[scores={xem.spell.cost.died=1..}] xem.spell.cost.withering.total_damage_to_pay
execute unless score @s[predicate=energy_manipulation:spell/cost/pay_cost] xem.spell.cost.withering.withering_async_time > #xlib.time xlib.op run function energy_manipulation:spell/cost/withering/calc_async

#turret counters
scoreboard players operation @s xem.spell.turrets_in_shape_tick_old = @s xem.spell.turrets_in_shape_tick
scoreboard players operation @s xem.spell.turrets_casted_in_tick_old = @s xem.spell.turrets_casted_in_tick
scoreboard players set @s xem.spell.turrets_in_shape_tick 0
scoreboard players set @s xem.spell.turrets_casted_in_tick 0

#==<Casting Fatigue>==#
scoreboard players remove @s[scores={xem.spell.casting_fatigue.spell_per_sec=1..}] xem.spell.casting_fatigue.spell_per_sec 1
scoreboard players operation @s xem.spell.casting_fatigue.percentage = @s xem.spell.casting_fatigue.spell_per_sec
scoreboard players operation #xem.spell.spells_per_sec.turret_extra xem.op = @s xem.spell.turrets_in_shape_tick_old
scoreboard players operation #xem.spell.spells_per_sec.turret_extra xem.op += @s xem.spell.turrets_casted_in_tick_old 
scoreboard players operation #xem.spell.spells_per_sec.turret_extra xem.op *= #5 xconst
scoreboard players operation @s xem.spell.casting_fatigue.percentage += #xem.spell.spells_per_sec.turret_extra xem.op
scoreboard players operation @s xem.spell.casting_fatigue.percentage *= #100 xconst
scoreboard players operation @s xem.spell.casting_fatigue.percentage /= #xem.spell.spells_per_sec.max xem.op

#==<Focus>==#
function energy_manipulation:mind/focus/player_tick
