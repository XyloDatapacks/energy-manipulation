# update max
scoreboard players operation @s xem.mind.focus.max = @s xem.mind.focus.max_base

# reset on death
execute if score @s xlib.player.reapawn_status matches 1 run scoreboard players operation @s xem.mind.focus = @s xem.mind.focus.max

# calc value
execute unless score @s xlib.player.reapawn_status matches -1 run scoreboard players add @s[tag=!xem.mind.meditation.is_meditating] xem.mind.focus 1
execute unless score @s xlib.player.reapawn_status matches -1 run scoreboard players add @s[predicate=xylo_library:is_sneaking] xem.mind.focus 3
scoreboard players remove @s[predicate=xylo_library:is_sprinting] xem.mind.focus 1
scoreboard players remove @s[predicate=xylo_library:is_swimming] xem.mind.focus 1
scoreboard players remove @s[scores={xlib.player.jumped=1..}] xem.mind.focus 10
scoreboard players remove @s[scores={xlib.player.taken_damage=1..}] xem.mind.focus 60
scoreboard players remove @s[scores={xlib.player.dealt_damage=1..}] xem.mind.focus 40
scoreboard players remove @s[tag=xem.mind.meditation.is_meditating] xem.mind.focus 1
scoreboard players operation @s xem.mind.focus > #0 xconst
scoreboard players operation @s xem.mind.focus < @s xem.mind.focus.max

#mind status
execute store success score @s xem.mind.is_concealed if score @s[tag=!xem.mind.meditation.is_meditating] xem.mind.focus matches 66..
execute store success score @s xem.mind.is_vulnerable if score @s xem.mind.focus matches ..33

