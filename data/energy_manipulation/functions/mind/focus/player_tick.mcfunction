#focus max = 100*20 = 2000
scoreboard players add @s xem.mind.focus 1
scoreboard players add @s[predicate=xylo_library:is_sneaking] xem.mind.focus 3
scoreboard players remove @s[predicate=xylo_library:is_sprinting] xem.mind.focus 1
scoreboard players remove @s[predicate=xylo_library:is_swimming] xem.mind.focus 1
scoreboard players remove @s[scores={xlib.player.jumped=1..}] xem.mind.focus 10
scoreboard players remove @s[scores={xlib.player.taken_damage=1..}] xem.mind.focus 60
scoreboard players remove @s[scores={xlib.player.dealth_damage=1..}] xem.mind.focus 40
scoreboard players operation @s xem.mind.focus > #0 xconst
scoreboard players operation @s xem.mind.focus < #2000 xconst

#mind status
execute store success score @s xem.mind.is_concealed if score @s[tag=!xem.mind.expand.is_expanding] xem.mind.focus matches 50..
execute store success score @s xem.mind.is_vulnerable if score @s[tag=!xem.mind.expand.is_expanding] xem.mind.focus matches ..0

scoreboard players operation #xem.mind.focus.display xem.op = @s xem.mind.focus
scoreboard players operation #xem.mind.focus.display xem.op /= #20 xconst
#title @s actionbar [{"score":{"objective":"xem.op","name":"#xem.mind.focus.display"}},"/100"]