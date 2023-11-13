# in: "energy_manipulation:op macro_data{shape, energy_type}"

execute store result score #xem.spell.run.shape._model.energy_type_none xem.op if data storage energy_manipulation:op macro_data{energy_type:"generic"}
execute if score #xem.spell.run.shape._model.energy_type_none xem.op matches 0 run function energy_manipulation:spell/run/shape/_model/get_cmd with storage energy_manipulation:op macro_data
execute if score #xem.spell.run.shape._model.energy_type_none xem.op matches 1 run function energy_manipulation:spell/run/shape/_model/override_cmd