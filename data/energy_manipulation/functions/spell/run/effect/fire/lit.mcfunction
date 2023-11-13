scoreboard players set #xem.spell.run.effect.fire.has_lit xem.op 0
execute if block ~ ~ ~ minecraft:campfire[lit=false] store success score #xem.spell.run.effect.fire.has_lit xem.op run setblock ~ ~ ~ minecraft:campfire[lit=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=false] store success score #xem.spell.run.effect.fire.has_lit xem.op run setblock ~ ~ ~ minecraft:soul_campfire[lit=true]

scoreboard players set #xem.spell.run.effect.fire.has_lit_tnt xem.op 0
execute if block ~ ~ ~ minecraft:tnt store success score #xem.spell.run.effect.fire.has_lit xem.op store success score #xem.spell.run.effect.fire.has_lit_tnt xem.op run setblock ~ ~ ~ minecraft:air
execute if score #xem.spell.run.effect.fire.has_lit_tnt xem.op matches 1 align x align y align z run summon tnt ~0.5 ~ ~0.5 {Fuse:80s,Motion:[0.0d,0.2d,0.0d]}

execute if score #xem.spell.run.effect.fire.has_lit xem.op matches 0 positioned ^ ^ ^-0.25 align x align z run summon minecraft:falling_block ~0.5 ~0.0 ~0.5 {Time:1,BlockState:{Name:fire},Motion:[0.0d,-0.1d,0.0d],Tags:["smithed.entity","smithed.strict"]}

# sound
playsound energy_manipulation:spell.effect.fire player @a ~ ~ ~ 0.6 1