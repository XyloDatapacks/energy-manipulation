#> energy_manipulation:mind/meditation/attack/remove_focus
# @context: entity hit by attack (or original entity if this is a rerouth)
# @within: energy_manipulation:mind/meditation/attack/start

# init focus (from global max focus, since if this entity does not have focus init, will not have max focus init either)
execute unless score @s xem.mind.focus = @s xem.mind.focus run scoreboard players operation @s[type=#energy_manipulation:focus_entity] xem.mind.focus = #xem.mind.focus.max xem.const
execute unless score @s xem.mind.focus matches 1.. run return 0

# get strength 
scoreboard players operation #xem.mind.meditation.attack.attack_strength xem.op = #xem.mind.meditation.attack.power xem.op
scoreboard players operation #xem.mind.meditation.attack.attack_strength xem.op *= #xem.mind.meditation.power.to_focus.numerator xem.const
scoreboard players operation #xem.mind.meditation.attack.attack_strength xem.op /= #xem.mind.meditation.power.to_focus.denominator xem.const

tellraw @a[tag=xem.debug.mind.meditation.attack] ["focus > input focus: ",{"score":{"objective":"xem.op","name":"#xem.mind.meditation.attack.attack_strength"}}]
tellraw @a[tag=xem.debug.mind.meditation.attack] ["focus > total focus: ",{"score":{"objective":"xem.mind.focus","name":"@s"}}]

# remove focus
scoreboard players operation @s xem.mind.focus -= #xem.mind.meditation.attack.attack_strength xem.op
tellraw @a[tag=xem.debug.mind.meditation.attack] ["focus > focus left: ",{"score":{"objective":"xem.mind.focus","name":"@s"}}]
execute if score @s xem.mind.focus matches 1.. run return run scoreboard players set #xem.mind.meditation.attack.focus_broken xem.op 0

# if focus is below zero

# calc power left
scoreboard players set #xem.mind.meditation.attack.power xem.op 0
scoreboard players operation #xem.mind.meditation.attack.power xem.op -= @s xem.mind.focus
scoreboard players operation #xem.mind.meditation.attack.power xem.op *= #xem.mind.meditation.power.to_focus.denominator xem.const
scoreboard players operation #xem.mind.meditation.attack.power xem.op /= #xem.mind.meditation.power.to_focus.numerator xem.const

# make focus positive
scoreboard players operation @s xem.mind.focus > #0 xconst

