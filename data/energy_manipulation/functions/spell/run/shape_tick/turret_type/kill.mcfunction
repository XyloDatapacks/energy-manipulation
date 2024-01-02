#<@> spell marker
# display -> spell marker

execute on vehicle run kill @s

#TODO

# if no terminate instruction kill and return
kill @s
return 1

# remove tags
tag @s remove xem.spell.inactive
tag @s remove xem.spell.shape_marker
tag @s remove xem.spell.turret_type
# get spell data
# ...
# execute instruction
# ...

