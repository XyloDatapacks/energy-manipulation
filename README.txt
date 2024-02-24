==<CHEATS>==
/function energy_manipulation:give/...
to get all items

==<GENERAL SETTINGS>==
/trigger xem.settings.shape_particles
to toggle particles for each shape (it is a player specific setting)

/trigger xem.settings.gui
to toggle the gui

==<Raw Energy>==
/scoreboard players set #xem.spell.raw_energy.max xem.const <value>
/scoreboard players set @s xem.spell.raw_energy.max <value>
Default value is set to 10

==<CASTING FATIGUE>==
/scoreboard players set #xem.spell.casting_fatigue.max xem.const <value>
/scoreboard players set @s xem.spell.casting_fatigue.max <value>
Default value is set to 2000

==<TRANSLOCATION EFFECT SETTINGS>==
/scoreboard players set #xem.spell.run.effect.translocation.max_range xem.op <value> 
Max teleport distance in blocks.
If set to negative value, the range is unlimited.
Default value is -1

/scoreboard players set #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op <value>
If a teleport can go between dimensions
1 is true, 0 is false
Default is 1

==<JAR OF ENERGY SETTINGS>==
/scoreboard players set #xem.const.jar_of_energy.fill.limit xem.const <value>
Max amount of energy that jars can hold