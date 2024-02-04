scoreboard players set #xem.test xem.op 1
execute store result score #xem.test xem.op run function energy_manipulation:testa {aa:3}
tellraw @a {"score":{"objective":"xem.op","name":"#xem.test"}}