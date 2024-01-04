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


#==<Casting Fatigue>==#

#projectile counters
scoreboard players operation @s xem.spell.casting_fatigue.projectiles_in_shape_tick_old = @s xem.spell.casting_fatigue.projectiles_in_shape_tick
scoreboard players operation @s xem.spell.casting_fatigue.projectiles_casted_in_tick_old = @s xem.spell.casting_fatigue.projectiles_casted_in_tick
scoreboard players set @s xem.spell.casting_fatigue.projectiles_in_shape_tick 0
scoreboard players set @s xem.spell.casting_fatigue.projectiles_casted_in_tick 0

#turret counters
scoreboard players operation @s xem.spell.casting_fatigue.turrets_in_shape_tick_old = @s xem.spell.casting_fatigue.turrets_in_shape_tick
scoreboard players operation @s xem.spell.casting_fatigue.turrets_casted_in_tick_old = @s xem.spell.casting_fatigue.turrets_casted_in_tick
scoreboard players set @s xem.spell.casting_fatigue.turrets_in_shape_tick 0
scoreboard players set @s xem.spell.casting_fatigue.turrets_casted_in_tick 0

#aoe counters
scoreboard players operation @s xem.spell.casting_fatigue.aoes_in_shape_tick_old = @s xem.spell.casting_fatigue.aoes_in_shape_tick
scoreboard players operation @s xem.spell.casting_fatigue.aoes_casted_in_tick_old = @s xem.spell.casting_fatigue.aoes_casted_in_tick
scoreboard players set @s xem.spell.casting_fatigue.aoes_in_shape_tick 0
scoreboard players set @s xem.spell.casting_fatigue.aoes_casted_in_tick 0

function energy_manipulation:spell/casting_fatigue/calc

#==<Focus>==#
function energy_manipulation:mind/focus/player_tick

#==<Raw Energy>==#
execute if score #xlib.timer.5tick xlib.op matches 0 unless score @s xlib.player.reapawn_status matches -1 unless score @s xem.spell.cost.withering.total_saturation_to_pay matches 1.. unless score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. unless score @s xem.spell.raw_energy matches 20.. run scoreboard players add @s xem.spell.raw_energy 1
execute if score @s xlib.player.reapawn_status matches 1 run scoreboard players set @s xem.spell.raw_energy 20

#==<Trinkets>==#

# scrying ward
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:1b}}} at @s run function energy_manipulation:trinket/scrying_ward/status/deactivate_mh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:0b}}} at @s run function energy_manipulation:trinket/scrying_ward/status/activate_mh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:1b}}}] at @s run function energy_manipulation:trinket/scrying_ward/status/deactivate_oh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:0b}}}] at @s run function energy_manipulation:trinket/scrying_ward/status/activate_oh


#==<GUI>==#

title @s[tag=xem.settings.show_gui] actionbar ["raw energy: ",{"score":{"objective":"xem.spell.raw_energy","name":"@s"}},"/20 | ","casting fatigue: ",{"score":{"objective":"xem.spell.casting_fatigue.percentage","name":"@s"}},"/100 | ","focus: ",{"score":{"objective":"xem.op","name":"#xem.mind.focus.display"}},"/100"]

