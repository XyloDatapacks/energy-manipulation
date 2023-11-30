# remove effects incompatible with that shape

$data remove storage energy_manipulation:op spell_display[{incompatible_shapes:["$(value)"]}]


#get values compatible with shape, and remove all the other that are not compatible
data remove storage energy_manipulation:op display_movement_purge_temp_arry
$data modify storage energy_manipulation:op display_movement_purge_temp_arry append from storage energy_manipulation:op spell_display[{compatible_shapes:["$(value)"]}]
data remove storage energy_manipulation:op spell_display[{compatible_shapes:[""]}]
data modify storage energy_manipulation:op spell_display insert 1 from storage energy_manipulation:op display_movement_purge_temp_arry[]
