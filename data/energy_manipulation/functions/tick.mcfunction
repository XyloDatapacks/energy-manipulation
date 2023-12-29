execute if score $energy_manipulation xvc.load_status matches 0 run return 0

#==<SPELLS>==#

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

execute as @a[tag=xem.meditation.is_meditating] if score @s xem.meditation.end_time <= #xlib.time xlib.op run function energy_manipulation:mind/meditation/exit/start

#==<TRINKETS>==#

# translocation ward
execute as @e[type=minecraft:item_display,tag=xem.trinket.translocation_ward.ward] run function energy_manipulation:trinket/translocation_ward/drop/check



#==<TRIGGERS>==#

execute as @a[scores={xem.settings.show_shape_particles=1..}] run function energy_manipulation:trigger/shape_particles/on
execute as @a[scores={xem.settings.show_shape_particles=0}] run function energy_manipulation:trigger/shape_particles/off
scoreboard players enable @a xem.settings.show_shape_particles

