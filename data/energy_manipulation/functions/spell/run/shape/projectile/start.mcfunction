scoreboard players set #xem.spell.run.shape.expire_time xem.op 100
data modify storage energy_manipulation:op shape_data set value {power:1.4}

data modify storage energy_manipulation:op macro_data set value {shape:"projectile"}
data modify storage energy_manipulation:op macro_data.energy_type set from storage energy_manipulation:op selected_concatenate.concatenate.cost.type
function energy_manipulation:spell/run/shape/_model/start

function energy_manipulation:spell/run/shape/_projectile_type/start

#shape sound
playsound energy_manipulation:spell.run.shape_creation player @a ^ ^ ^0.3 3.0 1