# -> {effect, shape}

# try effect particles (specific for each shape)
$execute unless function energy_manipulation:spell/run/effect/$(effect)/particles/$(shape) run return 1
# use shape particles (specific for each energy type)
$function energy_manipulation:spell/run/shape/$(shape)/particles/$(effect_type)

