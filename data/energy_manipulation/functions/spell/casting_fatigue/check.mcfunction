#out: "#xem.spell.casting_fatigue.check_passed xem.op"


#add
scoreboard players set #xem.spell.casting_fatigue.spells_per_sec xem.op 20
execute if score #xem.spell.casting_fatigue.spells_per_sec.mult xem.op matches 2.. run scoreboard players operation #xem.spell.casting_fatigue.spells_per_sec xem.op *= #xem.spell.casting_fatigue.spells_per_sec.mult xem.op
scoreboard players operation @s xem.spell.casting_fatigue.spell_rate += #xem.spell.casting_fatigue.spells_per_sec xem.op
scoreboard players reset #xem.spell.casting_fatigue.spells_per_sec.mult xem.op

#calc value
function energy_manipulation:spell/casting_fatigue/calc

#check
scoreboard players set #xem.spell.casting_fatigue.check_passed xem.op 1
execute if score #xem.spell.casting_fatigue.fatigue xem.op < #xem.spell.casting_fatigue.max xem.op run return 1

# spell > max
scoreboard players set #xem.spell.casting_fatigue.check_passed xem.op 0
scoreboard players operation @s xem.last_death_time = #xlib.time xlib.op

scoreboard players set @s xem.spell.casting_fatigue.fatigue 0
scoreboard players set @s xem.spell.casting_fatigue.percentage 0
scoreboard players set @s xem.spell.casting_fatigue.spell_rate 0
return 0


