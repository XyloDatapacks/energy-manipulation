

data modify storage test:op internal_gui1 set value '["hii"]'
data modify storage test:op internal_gui2 set value '["oooi",{"text":"fgwine"}]'
data modify storage test:op internal_gui set value ['{"storage":"test:op","nbt":"internal_gui1","interpret":true,"color":"#4404f9"}','{"storage":"energy_manipulation:op","nbt":"internal_gui","interpret":true,"color":"#4404f9"}']
tellraw @a [{"storage":"test:op","nbt":"internal_gui","interpret":true,"color":"#4404f9"}]