# function tag function
execute if score $energy_manipulation xvc.load_status matches 0 run return 0
#---------------------------

function xylo_library:internal/gui/generate/append {add:'{"storage":"energy_manipulation:op","nbt":"internal_gui","interpret":true,"color":"#4404f9"}'}
