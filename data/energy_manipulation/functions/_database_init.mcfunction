data remove storage energy_manipulation:spell nodes_values

#==<NON FINAL VALUES>==#
data modify storage energy_manipulation:spell nodes_values.concatenate set value [{value:"none"},{value:"standard"},{value:"split"}]
data modify storage energy_manipulation:spell nodes_values.concatenate[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.instruction set value [{value:"none"},{value:"direction"},{value:"position"},{value:"save_location"},{value:"mark_entity"},{value:"skip_to"}]
data modify storage energy_manipulation:spell nodes_values.instruction[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.position set value [{value:"current"},{value:"offset"},{value:"target"},{value:"ray_trace"},{value:"location"}]
data modify storage energy_manipulation:spell nodes_values.position[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.direction set value [{value:"current"},{value:"rotated"},{value:"facing"},{value:"rotated_as"},{value:"random"},{value:"aim_point"},{value:"location"}]
data modify storage energy_manipulation:spell nodes_values.direction[] merge value {final:0b,cost:0}


data modify storage energy_manipulation:spell nodes_values.shape set value [{value:"none",cost:0},{value:"self",cost:1},{value:"projectile",cost:2.5},{value:"sprout",cost:2},{value:"turret",cost:5.5}]
data modify storage energy_manipulation:spell nodes_values.shape[].final set value 0b

data modify storage energy_manipulation:spell nodes_values.effect set value [{value:"none",cost:0,energy_type:"generic",incompatible_shapes:[]},{value:"fire",cost:3.5,energy_type:"sun"},{value:"light",cost:2,energy_type:"sun"},{value:"break",cost:2.5,energy_type:"ground"},{value:"push",cost:3,energy_type:"dark"},{value:"pull",cost:3,energy_type:"dark"},{value:"spell_break",cost:8,energy_type:"dark"},{value:"translocation",cost:20,energy_type:"void"}]
data modify storage energy_manipulation:spell nodes_values.effect[].final set value 0b

data modify storage energy_manipulation:spell nodes_values.movement set value [{value:"none",cost:0},{value:"parabolic",cost:2,incompatible_shapes:["turret"]},{value:"straight",cost:2.5,incompatible_shapes:["turret"]},{value:"follow",cost:2,compatible_shapes:["","turret"]}]
data modify storage energy_manipulation:spell nodes_values.movement[].final set value 0b


data modify storage energy_manipulation:spell nodes_values.offset set value [{value:"xyz"},{value:"x"},{value:"y"},{value:"z"},{value:"xy"},{value:"xz"},{value:"yz"}]
data modify storage energy_manipulation:spell nodes_values.offset[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.angle set value [{value:"yawn-pitch"},{value:"yawn"},{value:"pitch"}]
data modify storage energy_manipulation:spell nodes_values.angle[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.target set value [{value:"none"},{value:"caster"},{value:"subject"},{value:"objects"},{value:"marked_entity"},{value:"player"},{value:"mob"},{value:"enemy"},{value:"ally"},{value:"animal"},{value:"item"},{value:"projectile"},{value:"spell"}]
data modify storage energy_manipulation:spell nodes_values.target[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.distance set value [{value:"none"},{value:"max"},{value:"min"},{value:"min-max"}]
data modify storage energy_manipulation:spell nodes_values.distance[] merge value {final:0b,cost:0}


data modify storage energy_manipulation:spell nodes_values.condition set value [{value:"none"},{value:"cooldown",incompatible_parent:["skip_to"]},{value:"target"}]
data modify storage energy_manipulation:spell nodes_values.condition[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.feature set value [{value:"none"},{value:"sneaking",incompatible_parent:["spell","projectile"]},{value:"swimming",incompatible_parent:["spell","projectile"]},{value:"on_fire",incompatible_parent:["spell"]},{value:"on_ground",incompatible_parent:["spell","projectile"]},{value:"in_air",incompatible_parent:["spell","projectile"]},{value:"shape_projectile",compatible_parent:["","spell"]},{value:"shape_sprout",compatible_parent:["","spell"]},{value:"shape_turret",compatible_parent:["","spell"]}]
data modify storage energy_manipulation:spell nodes_values.feature[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.target_count set value [{value:"any"},{value:"max"},{value:"min"},{value:"min-max"}]
data modify storage energy_manipulation:spell nodes_values.target_count[] merge value {final:0b,cost:0}

data modify storage energy_manipulation:spell nodes_values.fire_mode set value [{value:"once"},{value:"condition"},{value:"repeat"}]
data modify storage energy_manipulation:spell nodes_values.fire_mode[] merge value {final:0b,cost:0}


#==<FINAL VALUES>==#
data modify storage energy_manipulation:spell nodes_values.splits set value [{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8}]
data modify storage energy_manipulation:spell nodes_values.splits[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.program set value [{value:"none"},{value:"array"}]
data modify storage energy_manipulation:spell nodes_values.program[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.inverted set value [{value:"false_boolean"},{value:"true_boolean"}]
data modify storage energy_manipulation:spell nodes_values.inverted[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.blocking_hits set value [{value:"block_and_entities"},{value:"blocks"},{value:"entities"}]
data modify storage energy_manipulation:spell nodes_values.blocking_hits[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.offset_format set value [{value:"cardinal"},{value:"directional"}]
data modify storage energy_manipulation:spell nodes_values.offset_format[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.angle_format set value [{value:"absolute"},{value:"delta"}]
data modify storage energy_manipulation:spell nodes_values.angle_format[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.anchor set value [{value:"feet"},{value:"eyes"}]
data modify storage energy_manipulation:spell nodes_values.anchor[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.sort set value [{value:"arbitrary"},{value:"nearest"},{value:"furthest"},{value:"random"}]
data modify storage energy_manipulation:spell nodes_values.sort[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.selection set value [{value:"single"},{value:"multiple"}]
data modify storage energy_manipulation:spell nodes_values.selection[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.fire_rate set value [{value:"really_slow"},{value:"slow"},{value:"average"},{value:"fast"},{value:"really_fast"}]
data modify storage energy_manipulation:spell nodes_values.fire_rate[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.radius set value [{value:"small",cost:0},{value:"medium",cost:5},{value:"large",cost:10},{value:"extra_large",cost:15}]
data modify storage energy_manipulation:spell nodes_values.radius[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.index set value [{value:"all"},{value:-1},{value:0},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9}]
data modify storage energy_manipulation:spell nodes_values.index[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.concatenate_index set value [{value:0},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10}]
data modify storage energy_manipulation:spell nodes_values.concatenate_index[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.location_index set value [{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10}]
data modify storage energy_manipulation:spell nodes_values.location_index[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.entity_index_save set value [{value:1},{value:2},{value:3},{value:4},{value:5}]
data modify storage energy_manipulation:spell nodes_values.entity_index_save[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.entity_index set value [{value:"all"},{value:1},{value:2},{value:3},{value:4},{value:5}]
data modify storage energy_manipulation:spell nodes_values.entity_index[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.duration set value [{value:0},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30},{value:30},{value:31},{value:32},{value:33},{value:34},{value:35},{value:36},{value:37},{value:38},{value:39},{value:40},{value:41},{value:42},{value:43},{value:44},{value:45},{value:46},{value:47},{value:48},{value:49},{value:50},{value:51},{value:52},{value:53},{value:54},{value:55},{value:56},{value:57},{value:58},{value:59},{value:60},{value:90},{value:120},{value:150},{value:180},{value:240},{value:300},{value:360},{value:420},{value:480},{value:520},{value:600}]
data modify storage energy_manipulation:spell nodes_values.duration[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.timer set value [{value:0},{value:0.1},{value:0.2},{value:0.3},{value:0.4},{value:0.5},{value:0.6},{value:0.7},{value:0.8},{value:0.9},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30},{value:30},{value:31},{value:32},{value:33},{value:34},{value:35},{value:36},{value:37},{value:38},{value:39},{value:40},{value:41},{value:42},{value:43},{value:44},{value:45},{value:46},{value:47},{value:48},{value:49},{value:50},{value:51},{value:52},{value:53},{value:54},{value:55},{value:56},{value:57},{value:58},{value:59},{value:60},{value:90},{value:120},{value:150},{value:180},{value:240},{value:300},{value:360},{value:420},{value:480},{value:520},{value:600}]
data modify storage energy_manipulation:spell nodes_values.timer[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.min_count set value [{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10}]
data modify storage energy_manipulation:spell nodes_values.min_count[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.max_count set value [{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10}]
data modify storage energy_manipulation:spell nodes_values.max_count[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.min_distance set value [{value:0.25},{value:0.5},{value:0.75},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.min_distance[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.max_distance set value [{value:0.25},{value:0.5},{value:0.75},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.max_distance[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.max_distance_int set value [{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.max_distance_int[] merge value {final:1b,cost:0}


data modify storage energy_manipulation:spell nodes_values.yawn set value [{value:-180},{value:-175},{value:-170},{value:-165},{value:-160},{value:-155},{value:-150},{value:-145},{value:-140},{value:-135},{value:-130},{value:-125},{value:-120},{value:-115},{value:-110},{value:-105},{value:-100},{value:-95},{value:-90},{value:-85},{value:-80},{value:-75},{value:-70},{value:-65},{value:-60},{value:-55},{value:-50},{value:-45},{value:-40},{value:-35},{value:-30},{value:-25},{value:-20},{value:-15},{value:-10},{value:-5},{value:0},{value:5},{value:10},{value:15},{value:20},{value:25},{value:30},{value:35},{value:40},{value:45},{value:50},{value:55},{value:60},{value:65},{value:70},{value:75},{value:80},{value:85},{value:90},{value:95},{value:100},{value:105},{value:110},{value:115},{value:120},{value:125},{value:130},{value:135},{value:140},{value:145},{value:150},{value:155},{value:160},{value:165},{value:170},{value:175},{value:180}]
data modify storage energy_manipulation:spell nodes_values.yawn[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.pitch set value [{value:-180},{value:-175},{value:-170},{value:-165},{value:-160},{value:-155},{value:-150},{value:-145},{value:-140},{value:-135},{value:-130},{value:-125},{value:-120},{value:-115},{value:-110},{value:-105},{value:-100},{value:-95},{value:-90},{value:-85},{value:-80},{value:-75},{value:-70},{value:-65},{value:-60},{value:-55},{value:-50},{value:-45},{value:-40},{value:-35},{value:-30},{value:-25},{value:-20},{value:-15},{value:-10},{value:-5},{value:0},{value:5},{value:10},{value:15},{value:20},{value:25},{value:30},{value:35},{value:40},{value:45},{value:50},{value:55},{value:60},{value:65},{value:70},{value:75},{value:80},{value:85},{value:90},{value:95},{value:100},{value:105},{value:110},{value:115},{value:120},{value:125},{value:130},{value:135},{value:140},{value:145},{value:150},{value:155},{value:160},{value:165},{value:170},{value:175},{value:180}]
data modify storage energy_manipulation:spell nodes_values.pitch[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.yawn_positive set value [{value:0},{value:5},{value:10},{value:15},{value:20},{value:25},{value:30},{value:35},{value:40},{value:45},{value:50},{value:55},{value:60},{value:65},{value:70},{value:75},{value:80},{value:85},{value:90},{value:95},{value:100},{value:105},{value:110},{value:115},{value:120},{value:125},{value:130},{value:135},{value:140},{value:145},{value:150},{value:155},{value:160},{value:165},{value:170},{value:175},{value:180}]
data modify storage energy_manipulation:spell nodes_values.yawn_positive[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.pitch_positive set value [{value:0},{value:5},{value:10},{value:15},{value:20},{value:25},{value:30},{value:35},{value:40},{value:45},{value:50},{value:55},{value:60},{value:65},{value:70},{value:75},{value:80},{value:85},{value:90},{value:95},{value:100},{value:105},{value:110},{value:115},{value:120},{value:125},{value:130},{value:135},{value:140},{value:145},{value:150},{value:155},{value:160},{value:165},{value:170},{value:175},{value:180}]
data modify storage energy_manipulation:spell nodes_values.pitch_positive[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.x set value [{value:-30},{value:-29},{value:-28},{value:-27},{value:-26},{value:-25},{value:-24},{value:-23},{value:-22},{value:-21},{value:-20},{value:-19},{value:-18},{value:-17},{value:-16},{value:-15},{value:-14},{value:-13},{value:-12},{value:-11},{value:-10},{value:-9},{value:-8},{value:-7},{value:-6},{value:-5},{value:-4},{value:-3},{value:-2},{value:-1},{value:-0.75},{value:-0.5},{value:-0.25},{value:0},{value:0.25},{value:0.5},{value:0.75},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.x[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.y set value [{value:-30},{value:-29},{value:-28},{value:-27},{value:-26},{value:-25},{value:-24},{value:-23},{value:-22},{value:-21},{value:-20},{value:-19},{value:-18},{value:-17},{value:-16},{value:-15},{value:-14},{value:-13},{value:-12},{value:-11},{value:-10},{value:-9},{value:-8},{value:-7},{value:-6},{value:-5},{value:-4},{value:-3},{value:-2},{value:-1},{value:-0.75},{value:-0.5},{value:-0.25},{value:0},{value:0.25},{value:0.5},{value:0.75},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.y[] merge value {final:1b,cost:0}

data modify storage energy_manipulation:spell nodes_values.z set value [{value:-30},{value:-29},{value:-28},{value:-27},{value:-26},{value:-25},{value:-24},{value:-23},{value:-22},{value:-21},{value:-20},{value:-19},{value:-18},{value:-17},{value:-16},{value:-15},{value:-14},{value:-13},{value:-12},{value:-11},{value:-10},{value:-9},{value:-8},{value:-7},{value:-6},{value:-5},{value:-4},{value:-3},{value:-2},{value:-1},{value:-0.75},{value:-0.5},{value:-0.25},{value:0},{value:0.25},{value:0.5},{value:0.75},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},{value:17},{value:18},{value:19},{value:20},{value:21},{value:22},{value:23},{value:24},{value:25},{value:26},{value:27},{value:28},{value:29},{value:30}]
data modify storage energy_manipulation:spell nodes_values.z[] merge value {final:1b,cost:0}


#========================

data remove storage energy_manipulation:spell energy
data modify storage energy_manipulation:spell energy.sun set value {custom_model_data:12341001}
data modify storage energy_manipulation:spell energy.ground set value {custom_model_data:12341002}
data modify storage energy_manipulation:spell energy.soul set value {custom_model_data:12341003}
data modify storage energy_manipulation:spell energy.dark set value {custom_model_data:12341004}
data modify storage energy_manipulation:spell energy.void set value {custom_model_data:12341005}

data remove storage energy_manipulation:spell jar_of_energy
data modify storage energy_manipulation:spell jar_of_energy.sun set value {custom_model_data:12341001}
data modify storage energy_manipulation:spell jar_of_energy.ground set value {custom_model_data:12341002}
data modify storage energy_manipulation:spell jar_of_energy.soul set value {custom_model_data:12341003}
data modify storage energy_manipulation:spell jar_of_energy.dark set value {custom_model_data:12341004}
data modify storage energy_manipulation:spell jar_of_energy.void set value {custom_model_data:12341005}


#========================

data remove storage energy_manipulation:spell spell_book
data modify storage energy_manipulation:spell spell_book.sun.custom_model_data set value {open:12341000,base:12341001,pre_casting:12341002,activating:12341003,charging:12341004,overcharging:12341005}
data modify storage energy_manipulation:spell spell_book.sun.display_gradient set value ["#84140C","#8C2215","#93311E","#9B3F27","#A34D30","#AA5C39","#B26A42","#B9794B","#C18754","#C9955D","#D0A466","#D8B26F"]
data modify storage energy_manipulation:spell spell_book.ground.custom_model_data set value {open:12341006,base:12341007,pre_casting:12341008,activating:12341009,charging:12341010,overcharging:12341011}
data modify storage energy_manipulation:spell spell_book.ground.display_gradient set value ["#03640F","#146F1A","#267B25","#378630","#49913B","#5A9D46","#6CA852","#7DB45D","#8FBF68","#A0CA73","#B2D67E","#C3E189"]
data modify storage energy_manipulation:spell spell_book.soul.custom_model_data set value {open:12341012,base:12341013,pre_casting:12341014,activating:12341015,charging:12341016,overcharging:12341017}
data modify storage energy_manipulation:spell spell_book.soul.display_gradient set value ["#034962","#145870","#25677E","#387F96","#498DA3","#5A9BAF","#6BA8BC","#7CB6C8","#8DC4D5","#9DD2E1","#AEE0EE","#BFEEFA"]
data modify storage energy_manipulation:spell spell_book.dark.custom_model_data set value {open:12341018,base:12341019,pre_casting:12341020,activating:12341021,charging:12341022,overcharging:12341023}
data modify storage energy_manipulation:spell spell_book.dark.display_gradient set value ["#033329","#104236","#1C5144","#296051","#366F5E","#427E6B","#4F8D79","#5B9C86","#68AB93","#75BAA0","#81C9AE","#8ED8BB"]
data modify storage energy_manipulation:spell spell_book.void.custom_model_data set value {open:12341024,base:12341025,pre_casting:12341026,activating:12341027,charging:12341028,overcharging:12341029}
data modify storage energy_manipulation:spell spell_book.void.display_gradient set value ["#500875","#5F137E","#6D1E86","#7C298F","#8B3497","#993FA0","#A849A8","#B654B1","#C55FB9","#D46AC2","#E275CA","#F180D3"]

data modify storage energy_manipulation:spell spell_book.sun.circle set value {activating:12341007,charging:12341013,overcharging:12341019}
data modify storage energy_manipulation:spell spell_book.ground.circle set value {activating:12341008,charging:12341014,overcharging:12341020}
data modify storage energy_manipulation:spell spell_book.soul.circle set value {activating:12341009,charging:12341015,overcharging:12341021}
data modify storage energy_manipulation:spell spell_book.dark.circle set value {activating:12341010,charging:12341016,overcharging:12341022}
data modify storage energy_manipulation:spell spell_book.void.circle set value {activating:12341011,charging:12341017,overcharging:12341023}



#========================

data remove storage energy_manipulation:spell caster_armor
data modify storage energy_manipulation:spell caster_armor.helmet.sun.custom_model_data set value {base:12341001}
data modify storage energy_manipulation:spell caster_armor.helmet.sun.color set value {base:9646366}
data modify storage energy_manipulation:spell caster_armor.helmet.ground.custom_model_data set value {base:12341002}
data modify storage energy_manipulation:spell caster_armor.helmet.ground.color set value {base:2521893}
data modify storage energy_manipulation:spell caster_armor.helmet.soul.custom_model_data set value {base:12341003}
data modify storage energy_manipulation:spell caster_armor.helmet.soul.color set value {base:2451326}
data modify storage energy_manipulation:spell caster_armor.helmet.dark.custom_model_data set value {base:12341004}
data modify storage energy_manipulation:spell caster_armor.helmet.dark.color set value {base:1855812}
data modify storage energy_manipulation:spell caster_armor.helmet.void.custom_model_data set value {base:12341005}
data modify storage energy_manipulation:spell caster_armor.helmet.void.color set value {base:7151238}

data modify storage energy_manipulation:spell caster_armor.chestplate.sun.custom_model_data set value {base:12341001}
data modify storage energy_manipulation:spell caster_armor.chestplate.sun.color set value {base:9646366}
data modify storage energy_manipulation:spell caster_armor.chestplate.ground.custom_model_data set value {base:12341002}
data modify storage energy_manipulation:spell caster_armor.chestplate.ground.color set value {base:2521893}
data modify storage energy_manipulation:spell caster_armor.chestplate.soul.custom_model_data set value {base:12341003}
data modify storage energy_manipulation:spell caster_armor.chestplate.soul.color set value {base:2451326}
data modify storage energy_manipulation:spell caster_armor.chestplate.dark.custom_model_data set value {base:12341004}
data modify storage energy_manipulation:spell caster_armor.chestplate.dark.color set value {base:1855812}
data modify storage energy_manipulation:spell caster_armor.chestplate.void.custom_model_data set value {base:12341005}
data modify storage energy_manipulation:spell caster_armor.chestplate.void.color set value {base:7151238}

data modify storage energy_manipulation:spell caster_armor.leggings.sun.custom_model_data set value {base:12341001}
data modify storage energy_manipulation:spell caster_armor.leggings.sun.color set value {base:9646366}
data modify storage energy_manipulation:spell caster_armor.leggings.ground.custom_model_data set value {base:12341002}
data modify storage energy_manipulation:spell caster_armor.leggings.ground.color set value {base:2521893}
data modify storage energy_manipulation:spell caster_armor.leggings.soul.custom_model_data set value {base:12341003}
data modify storage energy_manipulation:spell caster_armor.leggings.soul.color set value {base:2451326}
data modify storage energy_manipulation:spell caster_armor.leggings.dark.custom_model_data set value {base:12341004}
data modify storage energy_manipulation:spell caster_armor.leggings.dark.color set value {base:1855812}
data modify storage energy_manipulation:spell caster_armor.leggings.void.custom_model_data set value {base:12341005}
data modify storage energy_manipulation:spell caster_armor.leggings.void.color set value {base:7151238}

data modify storage energy_manipulation:spell caster_armor.boots.sun.custom_model_data set value {base:12341001}
data modify storage energy_manipulation:spell caster_armor.boots.sun.color set value {base:9646366}
data modify storage energy_manipulation:spell caster_armor.boots.ground.custom_model_data set value {base:12341002}
data modify storage energy_manipulation:spell caster_armor.boots.ground.color set value {base:2521893}
data modify storage energy_manipulation:spell caster_armor.boots.soul.custom_model_data set value {base:12341003}
data modify storage energy_manipulation:spell caster_armor.boots.soul.color set value {base:2451326}
data modify storage energy_manipulation:spell caster_armor.boots.dark.custom_model_data set value {base:12341004}
data modify storage energy_manipulation:spell caster_armor.boots.dark.color set value {base:1855812}
data modify storage energy_manipulation:spell caster_armor.boots.void.custom_model_data set value {base:12341005}
data modify storage energy_manipulation:spell caster_armor.boots.void.color set value {base:7151238}

#========================

data remove storage energy_manipulation:spell shapes
data modify storage energy_manipulation:spell shapes.projectile.custom_model_data set value {generic:12341110,sun:12341111,ground:12341112,soul:12341113,dark:12341114,void:12341115}
data modify storage energy_manipulation:spell shapes.sprout.custom_model_data set value {generic:12341120,sun:12341121,ground:12341122,soul:12341123,dark:12341124,void:12341125}
data modify storage energy_manipulation:spell shapes.turret.custom_model_data set value {generic:12341130,sun:12341131,ground:12341132,soul:12341133,dark:12341134,void:12341135}

# tellraw @a {"text":"Energy Manipulation Database Loaded","color":"green"}