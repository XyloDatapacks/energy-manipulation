# op
scoreboard objectives remove xem.op 
scoreboard objectives remove xem.test 
scoreboard objectives remove xem.debug.cost_since_last_spell 
# version
scoreboard objectives remove xem.player_version 

# objectives
scoreboard objectives remove xem.spell.display.has_display 
scoreboard objectives remove xem.spell.display.index_input 
scoreboard objectives remove xem.spell.display.node_index_input 
scoreboard objectives remove xem.spell.display.showing_value 
scoreboard objectives remove xem.spell.book.open_books_count 
scoreboard objectives remove xem.spell.run.elaborate.concatenate_index 
scoreboard objectives remove xem.spell.run.elaborate.concatenate_index_max 

#casting fatigue
scoreboard objectives remove xem.spell.casting_fatigue.spell_rate 
scoreboard objectives remove xem.spell.casting_fatigue.last_spell_time 
scoreboard objectives remove xem.spell.casting_fatigue.percentage 
scoreboard objectives remove xem.spell.casting_fatigue.max 
scoreboard objectives remove xem.spell.casting_fatigue.projectiles_in_shape_tick 
scoreboard objectives remove xem.spell.casting_fatigue.projectiles_casted_in_tick 
scoreboard objectives remove xem.spell.casting_fatigue.projectiles_in_shape_tick_old 
scoreboard objectives remove xem.spell.casting_fatigue.projectiles_casted_in_tick_old 
scoreboard objectives remove xem.spell.casting_fatigue.turrets_in_shape_tick 
scoreboard objectives remove xem.spell.casting_fatigue.turrets_casted_in_tick 
scoreboard objectives remove xem.spell.casting_fatigue.turrets_in_shape_tick_old 
scoreboard objectives remove xem.spell.casting_fatigue.turrets_casted_in_tick_old 
scoreboard objectives remove xem.spell.casting_fatigue.aoes_in_shape_tick 
scoreboard objectives remove xem.spell.casting_fatigue.aoes_casted_in_tick 
scoreboard objectives remove xem.spell.casting_fatigue.aoes_in_shape_tick_old 
scoreboard objectives remove xem.spell.casting_fatigue.aoes_casted_in_tick_old 

#book
scoreboard objectives remove xem.spell.book.open_book_max_instructions 
scoreboard objectives remove xem.spell.book.open_book_max_concatenates 

scoreboard objectives remove xem.spell.book.casting_book_slot 
scoreboard objectives remove xem.spell.book.casting_book_type 
scoreboard objectives remove xem.spell.book.casting_time 
scoreboard objectives remove xem.spell.book.move_book_running 

#armor
scoreboard objectives remove xem.spell.armor.mastery.generic 
scoreboard objectives remove xem.spell.armor.mastery.sun 
scoreboard objectives remove xem.spell.armor.mastery.ground 
scoreboard objectives remove xem.spell.armor.mastery.soul 
scoreboard objectives remove xem.spell.armor.mastery.dark 
scoreboard objectives remove xem.spell.armor.mastery.void 

#spells
scoreboard objectives remove xem.spell.raw_energy
scoreboard objectives remove xem.spell.raw_energy.max

scoreboard objectives remove xem.spell.cost.withering.total_saturation_to_pay 
scoreboard objectives remove xem.spell.cost.withering.total_damage_to_pay 
scoreboard objectives remove xem.spell.cost.withering.withering_async_time 
scoreboard objectives remove xem.last_death_time 
scoreboard objectives remove xem.spell.caster_last_death_time 

scoreboard objectives remove xem.spell.book.dmg_blocked 
scoreboard objectives remove xem.spell.cost.died 

scoreboard objectives remove xem.spell.shape.expire_time 
scoreboard objectives remove xem.spell.shape.activation_time 
scoreboard objectives remove xem.spell.shape.cooldown_time 
scoreboard objectives remove xem.spell.shape.fire_rate 

scoreboard objectives remove xem.sort_raycast.jar_of_energy.place 
scoreboard objectives remove xem.jar_of_energy.energy_count 

function #energy_manipulation:shape_uninstall
function #energy_manipulation:effect_uninstall

#mind
scoreboard objectives remove xem.mind.is_concealed 
scoreboard objectives remove xem.mind.is_vulnerable 
scoreboard objectives remove xem.mind.focus 
scoreboard objectives remove xem.mind.focus.max
scoreboard objectives remove xem.mind.meditation.end_time 
scoreboard objectives remove xem.mind.meditation.start_time

scoreboard objectives remove xem.mind.meditation.action.attack_mode
scoreboard objectives remove xem.mind.meditation.action.propel
scoreboard objectives remove xem.mind.meditation.action.propel_time

#triggers
scoreboard objectives remove xem.settings.shape_particles 
scoreboard objectives remove xem.settings.gui
scoreboard objectives remove xem.settings.spell_settings

#==<Storages>==#
data remove storage energy_manipulation:spell nodes_values
data remove storage energy_manipulation:spell energy
data remove storage energy_manipulation:spell caster_armor
data remove storage energy_manipulation:spell shapes

data remove storage energy_manipulation:data players