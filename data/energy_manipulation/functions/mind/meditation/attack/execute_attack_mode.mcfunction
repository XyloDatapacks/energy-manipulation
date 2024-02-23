#> energy_manipulation:mind/meditation/attack/execute_attack_mode
# @context: entity hit by attack
# @within: energy_manipulation:mind/meditation/attack/start
# @macro: power

$execute if score #xem.mind.meditation.attack.attack_mode xem.op matches 0 run damage @s $(power) minecraft:generic 

#TODO: implement other modes
$tellraw @a[tag=xem.debug.mind.meditation.attack] ["damage dealt: $(power)"]