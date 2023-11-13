# -> {yawn_positive, pitch_positive}

$execute store result storage energy_manipulation:op angle_in.yawn float 0.5 run random value -$(yawn_positive)..$(yawn_positive)
$execute store result storage energy_manipulation:op angle_in.pitch float 0.5 run random value -$(pitch_positive)..$(pitch_positive)
