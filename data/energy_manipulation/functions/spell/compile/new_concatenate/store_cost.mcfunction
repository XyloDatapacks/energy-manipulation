# save energy type
$data modify storage energy_manipulation:op concatenate.$(path).cost set value {type:$(type)}

# apply concatenate discount
scoreboard players operation #xem.spell.compile.concat_discount xem.op = #xem.spell.compile.total_cost xem.op
scoreboard players operation #xem.spell.compile.concat_discount xem.op *= #xem.spell.compile.concat_discount_perc xem.op
scoreboard players operation #xem.spell.compile.concat_discount xem.op /= #100 xconst
scoreboard players operation #xem.spell.compile.total_cost xem.op -= #xem.spell.compile.concat_discount xem.op

# get split discount
scoreboard players set #xem.spell.compile.split_discount_perc xem.op 100
$execute store result score #xem.spell.compile.split_discount_perc_2 xem.op run data get storage energy_manipulation:op concatenate.$(path).splits
scoreboard players operation #xem.spell.compile.split_discount_perc_2 xem.op *= #8 xconst
scoreboard players operation #xem.spell.compile.split_discount_perc xem.op -= #xem.spell.compile.split_discount_perc_2 xem.op
scoreboard players operation #xem.spell.compile.split_discount_perc xem.op > #0 xconst
# apply split disocount
scoreboard players operation #xem.spell.compile.total_cost xem.op *= #xem.spell.compile.split_discount_perc xem.op
scoreboard players operation #xem.spell.compile.total_cost xem.op /= #100 xconst

# save cost
$execute store result storage energy_manipulation:op concatenate.$(path).cost.cost int 0.01 run scoreboard players operation #xem.spell.compile.total_cost xem.op > #100 xconst
scoreboard players set #xem.spell.compile.total_cost xem.op 0
