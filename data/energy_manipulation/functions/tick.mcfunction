# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

#==<SPELLS>==#

# casting fatigue tick for non player entities
execute as @e[type=#energy_manipulation:caster_entities,tag=xem.spell.casting_fatigue.has_to_tick] run function energy_manipulation:spell/casting_fatigue/tick

# execute spells (before spell casting cause it executes already the first tick of the spell)
execute as @e[type=minecraft:marker,tag=xem.spell.run] run function energy_manipulation:spell/run/tick

# spell casting
execute as @a[scores={xem.spell.book.casting_time=1..},advancements={energy_manipulation:spell/book/casting=false}] run function energy_manipulation:spell/book/casting_end
advancement revoke @a only energy_manipulation:spell/book/casting

# close display by distance
execute as @a[scores={xem.spell.display.has_display=1}] run function energy_manipulation:spell/book/tick_check
execute if score #xlib.timer.3sec xlib.op matches 0 as @e[type=minecraft:area_effect_cloud,tag=xem.spell.display] run function energy_manipulation:spell/display/check_from_display

# kill energy_globe display
kill @e[type=minecraft:item_display,tag=xem.energy_globe,predicate=xylo_library:no_vehicle]

#==<EFFECTS>==#

# translocation scoarch
execute as @e[type=minecraft:marker,tag=xem.spell.run.effect.translocation.scoarch] at @s run function energy_manipulation:spell/run/effect/translocation/scoarch/tick

#pull
execute as @e[type=minecraft:armor_stand,tag=xem.spell.run.effect.pull.entity] at @s run function energy_manipulation:spell/run/effect/pull/physics/tick
execute as @a[tag=xem.spell.run.effect.pull,predicate=!energy_manipulation:spell/run/effect/pull/is_being_pulled] run function energy_manipulation:spell/run/effect/pull/physics/push

#==<JARS>==#

# place
execute as @a[predicate=energy_manipulation:jar_of_energy/place/click] run function energy_manipulation:jar_of_energy/place/start
#break placed jar
execute as @e[type=minecraft:interaction,tag=xem.jar_of_energy.block] at @s unless block ~ ~ ~ #xylo_library:air_like run function energy_manipulation:jar_of_energy/block/break/break_auto

#==<MEDITATION>==#

execute as @e[type=minecraft:marker,tag=xem.mind.meditation.entity] run function energy_manipulation:mind/meditation/from_body_check/start
execute as @e[type=minecraft:marker,tag=xem.mind.meditation.mind_entity] run function energy_manipulation:mind/meditation/from_mind_check/start

#==<TRINKETS>==#

# translocation ward
execute as @e[type=minecraft:item_display,tag=xem.trinket.translocation_ward.ward] at @s run function energy_manipulation:trinket/translocation_ward/drop/check



#==<TRIGGERS>==#

execute as @a[scores={xem.settings.shape_particles=1..}] run function energy_manipulation:trigger/shape_particles/show_menu
execute as @a[scores={xem.settings.shape_particles=..-1}] run function energy_manipulation:trigger/shape_particles/set_values_and_refresh
scoreboard players enable @a xem.settings.shape_particles

execute as @a[scores={xem.settings.gui=1..}] run function energy_manipulation:trigger/gui/show_menu
execute as @a[scores={xem.settings.gui=..-1}] run function energy_manipulation:trigger/gui/set_values_and_refresh
scoreboard players enable @a xem.settings.gui

execute as @a[scores={xem.settings.spell_settings=1..}] run function energy_manipulation:trigger/spell_settings/show_menu
execute as @a[scores={xem.settings.spell_settings=..-1}] run function energy_manipulation:trigger/spell_settings/set_values_and_refresh
scoreboard players enable @a xem.settings.spell_settings

