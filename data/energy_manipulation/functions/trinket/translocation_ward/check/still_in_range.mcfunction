# return:
#   1: found entity in range
#   fail: entity not found

$execute as $(uuid) if entity @s[distance=..32] run return 1
return fail
