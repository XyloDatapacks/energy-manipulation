#prev_ring_area = ((circle*8/4)+1)^2 = ((circle*2)+1)^2
scoreboard players operation #xem.mind.mind_room.prev_ring_area xem.op = #xem.mind.mind_room.prev_circle xem.op
scoreboard players operation #xem.mind.mind_room.prev_ring_area xem.op *= #2 xconst
scoreboard players add #xem.mind.mind_room.prev_ring_area xem.op 1
scoreboard players operation #xem.mind.mind_room.prev_ring_area xem.op *= #xem.mind.mind_room.prev_ring_area xem.op
tellraw @a ["prev_circle: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.prev_circle"}}]
tellraw @a ["prev_ring_area: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.prev_ring_area"}}]


#in_circle_id = id-prev_ring_area
scoreboard players operation #xem.mind.mind_room.in_circle_id xem.op = #xem.mind.mind_room.id xem.op
scoreboard players operation #xem.mind.mind_room.in_circle_id xem.op -= #xem.mind.mind_room.prev_ring_area xem.op

#circle = prev_circle+1
scoreboard players operation #xem.mind.mind_room.circle xem.op = #xem.mind.mind_room.prev_circle xem.op
scoreboard players add #xem.mind.mind_room.circle xem.op 1

#ring_size = circle*=8
scoreboard players operation #xem.mind.mind_room.ring_size xem.op = #xem.mind.mind_room.circle xem.op
scoreboard players operation #xem.mind.mind_room.ring_size xem.op *= #8 xconst

#loop if needed
scoreboard players set #xem.mind.mind_room.check xem.op 0
execute if score #xem.mind.mind_room.in_circle_id xem.op matches ..-1 run scoreboard players set #xem.mind.mind_room.check xem.op 1
execute if score #xem.mind.mind_room.in_circle_id xem.op matches ..-1 run scoreboard players add #xem.mind.mind_room.prev_circle xem.op 1
execute if score #xem.mind.mind_room.in_circle_id xem.op matches ..-1 run scoreboard players operation #xem.mind.mind_room.prev_circle xem.op /= #2 xconst
execute if score #xem.mind.mind_room.in_circle_id xem.op > #xem.mind.mind_room.ring_size xem.op run scoreboard players set #xem.mind.mind_room.check xem.op 1
execute if score #xem.mind.mind_room.in_circle_id xem.op > #xem.mind.mind_room.ring_size xem.op run scoreboard players add #xem.mind.mind_room.prev_circle xem.op 1
execute if score #xem.mind.mind_room.check xem.op matches 1 run function energy_manipulation:mind/mind_room/check
