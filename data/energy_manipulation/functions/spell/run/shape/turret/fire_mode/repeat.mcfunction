# tag
data modify storage energy_manipulation:op running_spell_marker_update.Tags append value "xem.spell.turret_type.fm.repeat"

# fire rate
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{fire_rate:"really_slow"} run scoreboard players set @s xem.spell.shape.fire_rate 60
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{fire_rate:"slow"} run scoreboard players set @s xem.spell.shape.fire_rate 40
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{fire_rate:"average"} run scoreboard players set @s xem.spell.shape.fire_rate 20
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{fire_rate:"fast"} run scoreboard players set @s xem.spell.shape.fire_rate 10
execute if data storage energy_manipulation:op selected_concatenate.concatenate.shape.fire_mode{fire_rate:"really_fast"} run scoreboard players set @s xem.spell.shape.fire_rate 5

