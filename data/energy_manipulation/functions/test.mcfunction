tag @s add xem.spell.casting_fatigue.has_to_tick
scoreboard players operation @s xem.spell.casting_fatigue.max_base = #xem.spell.casting_fatigue.max xem.const
scoreboard players set #xem.spell.book.casting_power xem.op 100
data modify storage energy_manipulation:op spell set value [{concatenate:{cost:{cost:2,type:"generic"},program:[],shape:{condition:{value:"none"},duration:30,fire_mode:{fire_rate:"average",value:"repeat"},movement:{value:"none"},terminate:{value:"none"},value:"turret"},value:"standard"}},{concatenate:{cost:{cost:4,type:"generic"},program:[{index:0,instruction:{concatenate_index:10,condition:{inverted:"true_boolean",target:{distance:{value:"none"},feature:"none",value:"target"},target_count:{value:"any"},value:"target"},value:"skip_to"}},{index:1,instruction:{direction:{position:{anchor:"eyes",target:{distance:{value:"none"},feature:"none",value:"target"},value:"target"},value:"facing"},value:"direction"}}],shape:{effect:{value:"none"},movement:{value:"straight"},value:"projectile"},value:"standard"}}]
data modify storage energy_manipulation:op spell_book set value {tag:{energy_manipulation:{spell_book:{energy_type_id:3}}}}
execute at @s anchored eyes positioned ^ ^ ^ run function energy_manipulation:spell/run/new

say hi