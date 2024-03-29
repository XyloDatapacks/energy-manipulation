#https://math.stackexchange.com/questions/3157030/parametrizing-the-square-spiral

scoreboard players operation #xlib.utilities.math.sqrt.input xlib.op = #xem.mind.mind_room.id xem.op
scoreboard players operation #xlib.utilities.math.sqrt.input xlib.op *= #100 xconst
function xylo_library:utilities/math/sqrt/sqrt
scoreboard players operation #xem.mind.mind_room.n xem.op = #xlib.utilities.math.sqrt.out xlib.op
scoreboard players operation #xem.mind.mind_room.n xem.op /= #10 xconst

#odd check
scoreboard players operation #xem.mind.mind_room.is_odd xem.op = #xem.mind.mind_room.n xem.op
scoreboard players operation #xem.mind.mind_room.is_odd xem.op %= #2 xconst
execute if score #xem.mind.mind_room.is_odd xem.op matches 1 run scoreboard players remove #xem.mind.mind_room.n xem.op 1

#check 1
scoreboard players operation #xem.mind.mind_room.n^2 xem.op = #xem.mind.mind_room.n xem.op
scoreboard players operation #xem.mind.mind_room.n^2 xem.op *= #xem.mind.mind_room.n xem.op
scoreboard players operation #xem.mind.mind_room.n^2+n xem.op = #xem.mind.mind_room.n^2 xem.op
scoreboard players operation #xem.mind.mind_room.n^2+n xem.op += #xem.mind.mind_room.n xem.op
execute if score #xem.mind.mind_room.n^2 xem.op <= #xem.mind.mind_room.id xem.op if score #xem.mind.mind_room.id xem.op <= #xem.mind.mind_room.n^2+n xem.op run function energy_manipulation:mind/mind_room/get_pos/check1

#check 2
scoreboard players operation #xem.mind.mind_room.n^2+2n+1 xem.op = #xem.mind.mind_room.n^2+n xem.op
scoreboard players operation #xem.mind.mind_room.n^2+2n+1 xem.op += #xem.mind.mind_room.n xem.op
scoreboard players add #xem.mind.mind_room.n^2+2n+1 xem.op 1
execute if score #xem.mind.mind_room.n^2+n xem.op < #xem.mind.mind_room.id xem.op if score #xem.mind.mind_room.id xem.op <= #xem.mind.mind_room.n^2+2n+1 xem.op run function energy_manipulation:mind/mind_room/get_pos/check2

#check 3
scoreboard players operation #xem.mind.mind_room.n^2+3n+2 xem.op = #xem.mind.mind_room.n^2+2n+1 xem.op
scoreboard players operation #xem.mind.mind_room.n^2+3n+2 xem.op += #xem.mind.mind_room.n xem.op
scoreboard players add #xem.mind.mind_room.n^2+3n+2 xem.op 1
execute if score #xem.mind.mind_room.n^2+2n+1 xem.op < #xem.mind.mind_room.id xem.op if score #xem.mind.mind_room.id xem.op <= #xem.mind.mind_room.n^2+3n+2 xem.op run function energy_manipulation:mind/mind_room/get_pos/check3

#check 4
scoreboard players operation #xem.mind.mind_room.n^2+4n+3 xem.op = #xem.mind.mind_room.n^2+3n+2 xem.op
scoreboard players operation #xem.mind.mind_room.n^2+4n+3 xem.op += #xem.mind.mind_room.n xem.op
scoreboard players add #xem.mind.mind_room.n^2+4n+3 xem.op 1
execute if score #xem.mind.mind_room.n^2+3n+2 xem.op < #xem.mind.mind_room.id xem.op if score #xem.mind.mind_room.id xem.op <= #xem.mind.mind_room.n^2+4n+3 xem.op run function energy_manipulation:mind/mind_room/get_pos/check4

data remove storage energy_manipulation:op mind_room_pos
execute store result storage energy_manipulation:op mind_room_pos.x int 1 run scoreboard players get #xem.mind.mind_room.x xem.op
execute store result storage energy_manipulation:op mind_room_pos.z int 1 run scoreboard players get #xem.mind.mind_room.z xem.op

tellraw @a[tag=xem.debug] ["x: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.x"}}," z: ",{"score":{"objective":"xem.op","name":"#xem.mind.mind_room.z"}}]
