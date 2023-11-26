scoreboard players operation #xem.mind.mind_room.x xem.op = #xem.mind.mind_room.n xem.op
scoreboard players operation #xem.mind.mind_room.x xem.op /= #2 xconst
scoreboard players add #xem.mind.mind_room.x xem.op 1

scoreboard players set #xem.mind.mind_room.y xem.op 0
scoreboard players operation #xem.mind.mind_room.y xem.op -= #xem.mind.mind_room.x xem.op

scoreboard players operation #xem.mind.mind_room.x xem.op -= #xem.mind.mind_room.id xem.op
scoreboard players operation #xem.mind.mind_room.x xem.op += #xem.mind.mind_room.n^2+n xem.op
scoreboard players operation #xem.mind.mind_room.x xem.op += #xem.mind.mind_room.n xem.op


say check 3


