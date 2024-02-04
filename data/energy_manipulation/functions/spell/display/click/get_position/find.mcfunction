# return: position index

# find position based on the distance of the point from the player (since i moved twice by one, i can consider the start and end point as points on a circonference, centered in the ending point of the first movement)
# i can use the cosine theorem to get the distance between start and end point based on an angle = (2r^2 * (1 - cos(angle)))^(1/2)
# distance x or y = (2r^2 * (1 - cos(angle)))^(1/2) * cos(pi/2 - angle/2)
# distance z =      (2r^2 * (1 - cos(angle)))^(1/2) * sin(pi/2 - angle/2)
# r = 1

# execute positioned ~ ~1.6 ~ run particle dust 1 0 0 0.5 ^-0.7071 ^ ^0.2928 0.0 0.0 0.0 0.1 1

# +45°
execute positioned ^-0.7071 ^ ^0.2928 if entity @s[distance=..0.15] run return 4
# +22.5°
execute positioned ^-0.3826 ^ ^0.0761 if entity @s[distance=..0.15] run return 3
# 0°
execute positioned ^ ^ ^ if entity @s[distance=..0.15] run return 2
# -22.5°
execute positioned ^0.3826 ^ ^0.0761 if entity @s[distance=..0.15] run return 1
# -45°
execute positioned ^0.7071 ^ ^0.2928 if entity @s[distance=..0.15] run return 0

# failed
return -1