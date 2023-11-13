# save accumulated cost in last concatenate
data modify storage energy_manipulation:op macro_data set from storage energy_manipulation:op compile_energy_type
$data modify storage energy_manipulation:op macro_data.path set value "$(path)"
function energy_manipulation:spell/compile/new_concatenate/store_cost with storage energy_manipulation:op macro_data
# append last concatenate
data modify storage energy_manipulation:op spell append value {}
$data modify storage energy_manipulation:op spell[-1].concatenate set from storage energy_manipulation:op concatenate.$(path)
data modify storage energy_manipulation:op concatenate set value {}

# get new energy type
data modify storage energy_manipulation:op compile_energy_type.type set value "generic"
data remove storage energy_manipulation:op macro_data
$data modify storage energy_manipulation:op macro_data.value set from storage energy_manipulation:op spell_build[{path:"$(path).concatenate.shape",key:"effect"}].value
function energy_manipulation:spell/compile/new_concatenate/get_new_energy_type with storage energy_manipulation:op macro_data
