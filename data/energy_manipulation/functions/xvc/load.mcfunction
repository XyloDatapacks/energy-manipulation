# load
scoreboard players set $energy_manipulation xvc.load_status 1
data modify storage xvc_version:op packs append value {namespace:"energy_manipulation",version:10000,name:"Energy Manipulation"}

# required packs
data modify storage xvc_version:op packs[-1].required append value {namespace:"xylo_library",version:10000}
data modify storage xvc_version:op packs[-1].required append value {namespace:"xylo_items",version:10000}
data modify storage xvc_version:op packs[-1].required append value {namespace:"xylo_projectiles",version:10000}

# supported packs
#data modify storage xvc_version:op packs[-1].supported append value {namespace:"example",version:10000}

