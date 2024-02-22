scoreboard objectives add xem.spell.run.effect.translocation.scoarch_cooldown dummy
execute unless score #xem.spell.run.effect.translocation.max_range xem.op = #xem.spell.run.effect.translocation.max_range xem.op run scoreboard players set #xem.spell.run.effect.translocation.max_range xem.op -1
execute unless score #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op = #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op run scoreboard players set #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op 1
