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

function energy_manipulation:spell/casting_fatigue/tick
function energy_manipulation:spell/casting_fatigue/calc

#==<Focus>==#
function energy_manipulation:mind/focus/player_tick

#==<Raw Energy>==#
execute if score #xlib.timer.10tick xlib.op matches 0 unless score @s xlib.player.reapawn_status matches -1 unless score @s xem.spell.cost.withering.total_saturation_to_pay matches 1.. unless score @s xem.spell.cost.withering.total_damage_to_pay matches 1.. unless score @s xem.spell.raw_energy >= #xem.spell.raw_energy.max xem.op run scoreboard players add @s xem.spell.raw_energy 1
execute if score @s xlib.player.reapawn_status matches 1 run scoreboard players operation @s xem.spell.raw_energy = #xem.spell.raw_energy.max xem.op


#==<Meditation>==#

# start
execute if entity @s[predicate=xylo_library:double_sneak,scores={xlib.player.on_ground=1,xlib.player.rotation_y=8000..9000}] at @s run function energy_manipulation:mind/meditation/enter/start
# attack
#execute if entity @s[tag=xem.mind.expand.is_expanding] at @s positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=!#xylo_library:non_mob,tag=!xem.mind.expand.is_expanding,dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] run damage @s 1 magic

execute if score @s test_jump matches 0 run ride @e[type=horse,limit=1,sort=nearest,tag=test1] dismount
execute if score @s test_jump matches 1.. run ride @e[type=horse,limit=1,sort=nearest,tag=test1] mount @e[type=marker,limit=1,sort=nearest,tag=test1]
execute at @s as @e[type=item_display,limit=1,sort=nearest,tag=test2] positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score @s test_jump matches 1.. run data remove storage energy_manipulation:op macro_data
execute if score @s test_jump matches 1.. store result storage energy_manipulation:op macro_data.initial_speed double 0.2 run scoreboard players get @s test_jump
execute if score @s test_jump matches 1.. rotated as @s run function energy_manipulation:spell/run/shape/_movement/_motion with storage energy_manipulation:op macro_data
execute if score @s test_jump matches 1.. run data modify entity @e[type=snowball,limit=1,sort=nearest,tag=test2] Motion set from storage energy_manipulation:op temp_motion
scoreboard players set @s test_jump 0

#==<Trinkets>==#

# scrying ward
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:1b}}} at @s run function energy_manipulation:trinket/scrying_ward/status/deactivate_mh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.SelectedItem{tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:0b}}} at @s run function energy_manipulation:trinket/scrying_ward/status/activate_mh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:1b}}}] at @s run function energy_manipulation:trinket/scrying_ward/status/deactivate_oh
execute if score @s xitm.wfoas_used matches 1 if data storage xylo_library:op player_data.Inventory[{Slot:-106b,tag:{xylo:{id:"energy_manipulation:scrying_ward"},energy_manipulation:{active:0b}}}] at @s run function energy_manipulation:trinket/scrying_ward/status/activate_oh


#==<GUI>==#

execute if entity @s[tag=!xem.settings.hide_gui] unless entity @s[gamemode=spectator,tag=!xem.mind.meditation.is_meditating] run function energy_manipulation:gui/start

