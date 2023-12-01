scoreboard players operation #xem.mind.mind_room.n/2 xem.op = #xem.mind.mind_room.n xem.op
scoreboard players operation #xem.mind.mind_room.n/2 xem.op /= #2 xconst

scoreboard players set #xem.mind.mind_room.x xem.op -1
scoreboard players operation #xem.mind.mind_room.x xem.op -= #xem.mind.mind_room.n/2 xem.op

scoreboard players set #xem.mind.mind_room.z xem.op -1
scoreboard players operation #xem.mind.mind_room.z xem.op -= #xem.mind.mind_room.n/2 xem.op
scoreboard players operation #xem.mind.mind_room.z xem.op -= #xem.mind.mind_room.n^2+3n+2 xem.op
scoreboard players operation #xem.mind.mind_room.z xem.op += #xem.mind.mind_room.id xem.op


