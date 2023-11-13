#out: "#xem.spell.run._check_spell_per_sec.check_passed xem.op"

#remove
scoreboard players operation @s xem.spell.last_spell_time < #xlib.time xlib.op
scoreboard players operation #xem.spell.run._check_spell_per_sec.delta_time xem.op = #xlib.time xlib.op
scoreboard players operation #xem.spell.run._check_spell_per_sec.delta_time xem.op -= @s xem.spell.last_spell_time
scoreboard players operation @s xem.spell.spells_per_sec -= #xem.spell.run._check_spell_per_sec.delta_time xem.op
scoreboard players operation @s xem.spell.spells_per_sec > #0 xconst

#add
scoreboard players set #xem.spell.run.spells_per_sec xem.op 20
execute if score #xem.spell.run.spells_per_sec.mult xem.op matches 2.. run scoreboard players operation #xem.spell.run.spells_per_sec xem.op *= #xem.spell.run.spells_per_sec.mult xem.op
scoreboard players operation @s xem.spell.spells_per_sec += #xem.spell.run.spells_per_sec xem.op
scoreboard players reset #xem.spell.run.spells_per_sec.mult xem.op

#update time
scoreboard players operation @s xem.spell.last_spell_time = #xlib.time xlib.op

#check
scoreboard players set #xem.spell.run._check_spell_per_sec.check_passed xem.op 1
execute if score @s xem.spell.spells_per_sec < #xem.spell.spells_per_sec.max xem.op run return 1

# spell > max
scoreboard players set #xem.spell.run._check_spell_per_sec.check_passed xem.op 0
scoreboard players operation @s xem.last_death_time = #xlib.time xlib.op

scoreboard players operation #xem.spell.run._check_spell_per_sec.extra_spells xem.op = @s xem.spell.spells_per_sec
scoreboard players operation #xem.spell.run._check_spell_per_sec.extra_spells xem.op -= #xem.spell.spells_per_sec.max xem.op
scoreboard players operation #xem.spell.run._check_spell_per_sec.extra_spells xem.op /= #20 xconst

scoreboard players set @s xem.spell.spells_per_sec 0
return 0


