scoreboard players set #xem.spell.run.elaborate.is_split xem.op 1

# get split conunt
execute store result score #xem.spell.run.elaborate.split_count xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.splits
scoreboard players add #xem.spell.run.elaborate.split_count xem.op 1

# set initial rotation
data modify storage energy_manipulation:op initial_rotation set from storage energy_manipulation:op running_spell_marker.Rotation
# set rotation angle
data modify storage energy_manipulation:op instruction set value {value:"rotated",angle:{value:"yawn-pitch",angle_format:"delta"}}
execute store result score #xem.spell.run.elaborate.split_yawn xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.yawn
execute store result score #xem.spell.run.elaborate.split_pitch xem.op run data get storage energy_manipulation:op selected_concatenate.concatenate.pitch
execute unless score #xem.spell.run.elaborate.split_yawn xem.op matches 0 store result storage energy_manipulation:op instruction.angle.yawn float -0.5 run scoreboard players operation #xem.spell.run.elaborate.split_yawn xem.op *= #xem.spell.run.elaborate.split_count xem.op 
execute unless score #xem.spell.run.elaborate.split_pitch xem.op matches 0 store result storage energy_manipulation:op instruction.angle.pitch float -0.5 run scoreboard players operation #xem.spell.run.elaborate.split_pitch xem.op *= #xem.spell.run.elaborate.split_count xem.op
function energy_manipulation:spell/run/elaborate/instruction/direction/start
# update for next split
data modify storage energy_manipulation:op running_spell_marker.Rotation set from storage energy_manipulation:op initial_rotation

scoreboard players remove #xem.spell.run.elaborate.split_count xem.op 2

# add count to shape per sec (and prevent extra casts)
scoreboard players set #xem.spell.run._check_spell_per_sec.check_passed xem.op 0
scoreboard players operation #xem.spell.run.spells_per_sec.mult xem.op = #xem.spell.run.elaborate.split_count xem.op
function energy_manipulation:spell/run/_check_spell_per_sec/find_caster with storage energy_manipulation:op running_spell_marker.data.energy_manipulation.spell_data

# kill and return + particles for excess number
execute unless score #xem.spell.run._check_spell_per_sec.check_passed xem.op matches 1 at @s run function energy_manipulation:spell/cost/fx_spell_cost_not_paid
execute unless score #xem.spell.run._check_spell_per_sec.check_passed xem.op matches 1 run kill @s
execute unless score #xem.spell.run._check_spell_per_sec.check_passed xem.op matches 1 run return 0

# first concatenate
function energy_manipulation:spell/run/elaborate/concatenate
# execute concatenates (if not failed)
function energy_manipulation:spell/run/elaborate/split_loop
