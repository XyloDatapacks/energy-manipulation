execute if score #xem.mind.meditation.mind.sneak xem.op matches 1 run scoreboard players set @s xem.mind.meditation.mind.action.sneak_time 1


# double sneak
scoreboard players operation @s[scores={xem.mind.meditation.mind.action.sneak_time=1,xem.mind.meditation.mind.action.sneaking=0}] xem.mind.meditation.mind.action.double_sneak_time = #xlib.time xlib.op
scoreboard players add @s[scores={xem.mind.meditation.mind.action.sneak_time=1,xem.mind.meditation.mind.action.sneaking=0}] xem.mind.meditation.mind.action.double_sneak_time 10
scoreboard players remove @s[scores={xem.mind.meditation.mind.action.sneak_time=1,xem.mind.meditation.mind.action.sneaking=0}] xem.mind.meditation.mind.action.double_sneak 1
scoreboard players remove @s[scores={xem.mind.meditation.mind.action.sneak_time=0,xem.mind.meditation.mind.action.sneaking=1}] xem.mind.meditation.mind.action.double_sneak 1

execute if score @s[scores={xem.mind.meditation.mind.action.double_sneak=..1}] xem.mind.meditation.mind.action.double_sneak_time < #xlib.time xlib.op run scoreboard players set @s xem.mind.meditation.mind.action.double_sneak 0
scoreboard players set @s[scores={xem.mind.meditation.mind.action.double_sneak=1}] xem.mind.meditation.mind.action.double_sneak 0
scoreboard players set @s[scores={xem.mind.meditation.mind.action.double_sneak=..-4}] xem.mind.meditation.mind.action.double_sneak 1
execute if score @s xem.mind.meditation.mind.action.double_sneak matches 1 run say double
execute if score @s xem.mind.meditation.mind.action.double_sneak matches 1 run scoreboard players set #xem.mind.meditation.mind.sneak xem.op 2

# sneaking
execute store success score @s xem.mind.meditation.mind.action.sneaking run scoreboard players set @s[scores={xem.mind.meditation.mind.action.sneak_time=1..}] xem.mind.meditation.mind.action.sneak_time 0
