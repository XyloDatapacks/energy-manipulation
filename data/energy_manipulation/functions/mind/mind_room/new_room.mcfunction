data remove storage energy_manipulation:op macro_data
execute store result score #xem.mind.mind_room.id xem.op run data get storage energy_manipulation:data mind_plane.last_room.id

#prev_circle = (id-2)/8+1
scoreboard players operation #xem.mind.mind_room.prev_circle xem.op = #xem.mind.mind_room.id xem.op
scoreboard players remove #xem.mind.mind_room.prev_circle xem.op 2
scoreboard players operation #xem.mind.mind_room.prev_circle xem.op /= #8 xconst
#get data
function energy_manipulation:mind/mind_room/check




tellraw @a "\n\n-------------"
tellraw @a ["id: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.id"}}]
tellraw @a ["prev_circle: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.prev_circle"}}]
tellraw @a ["prev_ring_area: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.prev_ring_area"}}]
tellraw @a ["circle: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.circle"}}]
tellraw @a ["in_circle_id: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.in_circle_id"}}]
tellraw @a "-------------\n"


execute store result storage energy_manipulation:data mind_plane.last_room.id int 1 run scoreboard players add #xem.mind.mind_room.id xem.op 1

