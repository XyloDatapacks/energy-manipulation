#> energy_manipulation:mind/meditation/attack/remove_focus
# @context: entity hit by attack (or original entity if this is a rerouth)
# @within: energy_manipulation:mind/meditation/attack/start

# init focus (from global max focus, since if this entity does not have focus init, will not have max focus init either)
execute unless score @s xem.mind.focus = @s xem.mind.focus run scoreboard players operation @s xem.mind.focus = #xem.mind.focus.max xem.op
# get strength 
scoreboard players operation #xem.mind.meditation.attack.attack_strength xem.op = #xem.mind.meditation.attack.power xem.op
scoreboard players operation #xem.mind.meditation.attack.attack_strength xem.op /= #4 xconst

tellraw @a[tag=xem.debug.mind.meditation.attack] ["focus removed: ",{"score":{"objective":"xem.op","name":"#xem.mind.meditation.attack.attack_strength"}}]

# remove focus
scoreboard players operation @s xem.mind.focus -= #xem.mind.meditation.attack.attack_strength xem.op
execute if score @s xem.mind.focus matches 1.. run scoreboard players set #xem.mind.meditation.attack.focus_broken xem.op 0
scoreboard players operation @s xem.mind.focus > #0 xconst

