#validation
execute if score $energy_manipulation xvc.load_status matches 0 run return 0

# Reset scoreboards so packs can set values accurate for current load.
scoreboard players set xem.energy_manipulation load.status 1

# op
scoreboard objectives add xem.op dummy
scoreboard objectives add xem.test dummy
scoreboard objectives add xem.debug.cost_since_last_spell dummy
# version
execute store result score #xem.pack_version xem.op run data get storage xvc_version:op packs[{namespace:"energy_manipulation"}].version
scoreboard objectives add xem.player_version dummy

# objectives
scoreboard objectives add xem.spell.display.has_display dummy
scoreboard objectives add xem.spell.display.index_input dummy
scoreboard objectives add xem.spell.display.node_index_input dummy
scoreboard objectives add xem.spell.display.showing_value dummy
scoreboard objectives add xem.spell.book.open_books_count dummy
scoreboard objectives add xem.spell.run.elaborate.concatenate_index dummy
scoreboard objectives add xem.spell.run.elaborate.concatenate_index_max dummy

#casting fatigue 
scoreboard objectives add xem.spell.casting_fatigue.spell_rate dummy
scoreboard objectives add xem.spell.casting_fatigue.last_spell_time dummy
scoreboard objectives add xem.spell.casting_fatigue.percentage dummy
execute unless score #xem.spell.casting_fatigue.max xem.op = #xem.spell.casting_fatigue.max xem.op run scoreboard players set #xem.spell.casting_fatigue.max xem.op 2000
scoreboard objectives add xem.spell.casting_fatigue.max dummy
scoreboard objectives add xem.spell.casting_fatigue.max_base dummy
scoreboard objectives add xem.spell.casting_fatigue.projectiles_in_shape_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.projectiles_casted_in_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.projectiles_in_shape_tick_old dummy
scoreboard objectives add xem.spell.casting_fatigue.projectiles_casted_in_tick_old dummy
scoreboard objectives add xem.spell.casting_fatigue.turrets_in_shape_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.turrets_casted_in_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.turrets_in_shape_tick_old dummy
scoreboard objectives add xem.spell.casting_fatigue.turrets_casted_in_tick_old dummy
scoreboard objectives add xem.spell.casting_fatigue.aoes_in_shape_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.aoes_casted_in_tick dummy
scoreboard objectives add xem.spell.casting_fatigue.aoes_in_shape_tick_old dummy
scoreboard objectives add xem.spell.casting_fatigue.aoes_casted_in_tick_old dummy

#book
scoreboard objectives add xem.spell.book.open_book_max_instructions dummy
scoreboard objectives add xem.spell.book.open_book_max_concatenates dummy

scoreboard objectives add xem.spell.book.casting_book_slot dummy
scoreboard objectives add xem.spell.book.casting_book_type dummy
scoreboard objectives add xem.spell.book.casting_time dummy
scoreboard objectives add xem.spell.book.move_book_running dummy

#armor
scoreboard objectives add xem.spell.armor.mastery.generic dummy
scoreboard objectives add xem.spell.armor.mastery.sun dummy
scoreboard objectives add xem.spell.armor.mastery.ground dummy
scoreboard objectives add xem.spell.armor.mastery.soul dummy
scoreboard objectives add xem.spell.armor.mastery.dark dummy
scoreboard objectives add xem.spell.armor.mastery.void dummy

#spells
scoreboard objectives add xem.spell.raw_energy dummy
execute unless score #xem.spell.raw_energy.max xem.op = #xem.spell.raw_energy.max xem.op run scoreboard players set #xem.spell.raw_energy.max xem.op 10
scoreboard objectives add xem.spell.raw_energy.max dummy
scoreboard objectives add xem.spell.raw_energy.max_base dummy

scoreboard objectives add xem.spell.cost.withering.total_saturation_to_pay dummy
scoreboard objectives add xem.spell.cost.withering.total_damage_to_pay dummy
scoreboard objectives add xem.spell.cost.withering.withering_async_time dummy
scoreboard objectives add xem.last_death_time dummy
scoreboard objectives add xem.spell.caster_last_death_time dummy

scoreboard objectives add xem.spell.book.dmg_blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add xem.spell.cost.died minecraft.custom:minecraft.deaths

scoreboard objectives add xem.spell.shape.expire_time dummy
scoreboard objectives add xem.spell.shape.activation_time dummy
scoreboard objectives add xem.spell.shape.cooldown_time dummy
scoreboard objectives add xem.spell.shape.fire_rate dummy

scoreboard objectives add xem.sort_raycast.jar_of_energy.place dummy
scoreboard objectives add xem.jar_of_energy.energy_count dummy
execute unless score #xem.const.jar_of_energy.fill.limit xem.op = #xem.const.jar_of_energy.fill.limit xem.op run scoreboard players set #xem.const.jar_of_energy.fill.limit xem.op 1000

function #energy_manipulation:shape_load
function #energy_manipulation:effect_load

#mind
scoreboard objectives add xem.mind.is_concealed dummy
scoreboard objectives add xem.mind.is_vulnerable dummy
scoreboard objectives add xem.mind.focus dummy
execute unless score #xem.mind.focus.max xem.op = #xem.mind.focus.max xem.op run scoreboard players set #xem.mind.focus.max xem.op 2000
scoreboard objectives add xem.mind.focus.max dummy
scoreboard objectives add xem.mind.focus.max_base dummy
scoreboard objectives add xem.mind.meditation.end_time dummy
scoreboard objectives add xem.mind.meditation.start_time dummy
execute unless score #xem.mind.meditation.duration xem.op = #xem.mind.meditation.duration xem.op run scoreboard players set #xem.mind.meditation.duration xem.op 400

execute unless score #xem.mind.meditation.power_multiplier_default xem.op = #xem.mind.meditation.power_multiplier_default xem.op run scoreboard players set #xem.mind.meditation.power_multiplier_default xem.op 100
scoreboard objectives add xem.mind.meditation.power_multiplier dummy
scoreboard objectives add xem.mind.meditation.power_multiplier_base dummy

scoreboard objectives add xem.mind.meditation.action.attack_mode dummy
scoreboard objectives add xem.mind.meditation.action.propel dummy
scoreboard objectives add xem.mind.meditation.action.propel_time dummy

#triggers
scoreboard objectives add xem.settings.shape_particles trigger
scoreboard objectives add xem.settings.gui trigger
scoreboard objectives add xem.settings.spell_settings trigger

# init
execute store result score #xem.maxCommandChainLength xem.op run gamerule maxCommandChainLength
execute if score #xem.maxCommandChainLength xem.op matches ..100000 run gamerule maxCommandChainLength 100000


# functions
function energy_manipulation:_database_init

# revoke advancements
advancement revoke @a from energy_manipulation:revoke

