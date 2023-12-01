execute if score $energy_manipulation xvc.load_status matches 0 run return 0
scoreboard players set $energy_manipulation xvc.load_status 1

# Reset scoreboards so packs can set values accurate for current load.
scoreboard players set xem.energy_manipulation load.status 1

# op
scoreboard objectives add xem.op dummy
scoreboard objectives add xem.test dummy
scoreboard objectives add xem.debug.cost_since_last_spell dummy

# objectives
scoreboard objectives add xem.spell.display.has_display dummy
scoreboard objectives add xem.spell.display.index_input dummy
scoreboard objectives add xem.spell.display.node_index_input dummy
scoreboard objectives add xem.spell.display.showing_value dummy
scoreboard objectives add xem.spell.book.open_books_count dummy
scoreboard objectives add xem.spell.run.elaborate.concatenate_index dummy
scoreboard objectives add xem.spell.run.elaborate.concatenate_index_max dummy

scoreboard objectives add xem.spell.spells_per_sec dummy
scoreboard objectives add xem.spell.last_spell_time dummy
execute unless score #xem.spell.spells_per_sec.max xem.op = #xem.spell.spells_per_sec.max xem.op run scoreboard players set #xem.spell.spells_per_sec.max xem.op 100

scoreboard objectives add xem.spell.book.open_book_max_instructions dummy
scoreboard objectives add xem.spell.book.open_book_max_concatenates dummy

scoreboard objectives add xem.spell.book.casting_book_slot dummy
scoreboard objectives add xem.spell.book.casting_book_type dummy
scoreboard objectives add xem.spell.book.casting_time dummy
scoreboard objectives add xem.spell.book.move_book_running dummy

scoreboard objectives add xem.spell.armor.mastery.generic dummy
scoreboard objectives add xem.spell.armor.mastery.sun dummy
scoreboard objectives add xem.spell.armor.mastery.ground dummy
scoreboard objectives add xem.spell.armor.mastery.soul dummy
scoreboard objectives add xem.spell.armor.mastery.dark dummy
scoreboard objectives add xem.spell.armor.mastery.void dummy

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

scoreboard objectives add xem.spell.run.effect.translocation.scoarch_cooldown dummy
execute unless score #xem.spell.run.effect.translocation.max_range xem.op = #xem.spell.run.effect.translocation.max_range xem.op run scoreboard players set #xem.spell.run.effect.translocation.max_range xem.op -1
execute unless score #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op = #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op run scoreboard players set #xem.spell.run.effect.translocation.inter_dimensional_tp xem.op 1
scoreboard objectives add xem.spell.run.effect.pull.ride.end_point.x dummy
scoreboard objectives add xem.spell.run.effect.pull.ride.end_point.y dummy
scoreboard objectives add xem.spell.run.effect.pull.ride.end_point.z dummy
scoreboard objectives add xem.grapple_max_length dummy
scoreboard objectives add xem.spell.run.effect.pull.motion.x dummy
scoreboard objectives add xem.spell.run.effect.pull.motion.y dummy
scoreboard objectives add xem.spell.run.effect.pull.motion.z dummy
scoreboard objectives add xem.spell.run.effect.pull.entity.expire_time dummy

scoreboard objectives add xem.sort_raycast.jar_of_energy.place dummy
scoreboard objectives add xem.jar_of_energy.energy_count dummy

scoreboard objectives add xem.mind.is_concealed dummy
scoreboard objectives add xem.mind.is_vulnerable dummy
scoreboard objectives add xem.mind.focus dummy
scoreboard objectives add xem.meditation.end_time dummy
scoreboard objectives add xem.meditation.previous_gamemode dummy

# init
execute unless score #xem.const.jar_of_energy.fill.limit xem.op = #xem.const.jar_of_energy.fill.limit xem.op run scoreboard players set #xem.const.jar_of_energy.fill.limit xem.op 1000

# functions
function energy_manipulation:_database_init

# revoke advancements
advancement revoke @a from energy_manipulation:revoke

