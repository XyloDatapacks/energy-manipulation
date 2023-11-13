# can break
scoreboard players set #xem.spell.run.effect.break.can_break xem.op 0
execute unless score #xem.spell.run.effect.spell_power xem.op matches 50.. unless block ~ ~ ~ #xylo_library:unbreakable unless block ~ ~ ~ #xylo_library:high_resistance run scoreboard players set #xem.spell.run.effect.break.can_break xem.op 1
execute if score #xem.spell.run.effect.spell_power xem.op matches 50.. unless block ~ ~ ~ #xylo_library:unbreakable run scoreboard players set #xem.spell.run.effect.break.can_break xem.op 1
# exit
execute if score #xem.spell.run.effect.break.can_break xem.op matches 0 run return 0


$execute as $(caster_uuid) run loot spawn ~0.5 ~0.5 ~0.5 mine ~ ~ ~ mainhand
tag @e[type=minecraft:item,dy=0] add xem.spell.run.effect.break.protect
setblock ~ ~ ~ minecraft:air destroy
kill @e[type=minecraft:item,dy=0,tag=!xem.spell.run.effect.break.protect,sort=nearest,limit=1]
tag @e[type=minecraft:item,dy=0] remove xem.spell.run.effect.break.protect
