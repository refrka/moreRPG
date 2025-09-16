extends Node


var character: Character

var starting_item_key_list = {
	Enums.ITEM_TYPE.CRAFTING: {
		Enums.CRAFTING.CLOTH_STRIP: 1,
	},
	Enums.ITEM_TYPE.EQUIPMENT: {
		Enums.EQUIPMENT.HELMET_LEATHER: 1,
		Enums.EQUIPMENT.ANCIENT_AMULET: 1,
		Enums.EQUIPMENT.BOOTS_LEATHER: 1,
		Enums.EQUIPMENT.CLOAK_PATCHED: 1,
		Enums.EQUIPMENT.GREAVES_LEATHER: 1,
		Enums.EQUIPMENT.BRACERS_BONE: 1,
	},
	Enums.ITEM_TYPE.POTION: {
		Enums.POTION.LIGHT_HEALING: 1,
		Enums.POTION.SWIFT_FEET: 1,
	},
	Enums.ITEM_TYPE.PROVISION: {
		Enums.PROVISION.WILD_BERRIES: 1,
	},
	Enums.ITEM_TYPE.TOOL: {
		Enums.TOOL.TORCH: 1,
	},
	Enums.ITEM_TYPE.VALUABLE: { },
	Enums.ITEM_TYPE.WEAPON: {
		Enums.WEAPON.DAGGER_IRON: 1,
	},
}

var starting_coinage = {
	Enums.VALUABLE.COIN_SILVER: 10,
	Enums.VALUABLE.COIN_GOLD: 1,
}


func new_character(_name: String) -> Character:
	character = Character.new(_name)
	character.create_inventory()
	Signals.CHARACTER_created.emit()
	return character


func get_property_value(property: Enums.CHARACTER_PROPERTY) -> Variant:
	var value: Variant
	match property:
		Enums.CHARACTER_PROPERTY.LEVEL:
			value = character.level
		Enums.CHARACTER_PROPERTY.MAX_HEALTH:
			value = character.max_health
		Enums.CHARACTER_PROPERTY.CURRENT_HEALTH:
			value = character.current_health
		Enums.CHARACTER_PROPERTY.MAX_ENERGY:
			value = character.max_energy
		Enums.CHARACTER_PROPERTY.CURRENT_ENERGY:
			value = character.current_energy
		Enums.CHARACTER_PROPERTY.MAX_MAGIC:
			value = character.max_magic
		Enums.CHARACTER_PROPERTY.CURRENT_MAGIC:
			value = character.current_magic
		Enums.CHARACTER_PROPERTY.MIGHT:
			value = character.base_might
		Enums.CHARACTER_PROPERTY.AGILITY:
			value = character.base_agility
		Enums.CHARACTER_PROPERTY.WITS:
			value = character.base_wits
		Enums.CHARACTER_PROPERTY.CARRY_WEIGHT:
			value = character.current_carry_weight
	return value


func update_property_value(property: Enums.CHARACTER_PROPERTY, new_value: Variant) -> void:
	match property:
		Enums.CHARACTER_PROPERTY.LEVEL:
			character.level = new_value
		Enums.CHARACTER_PROPERTY.MAX_HEALTH:
			character.max_health = new_value
		Enums.CHARACTER_PROPERTY.CURRENT_HEALTH:
			character.current_health = new_value
		Enums.CHARACTER_PROPERTY.MAX_ENERGY:
			character.max_energy = new_value
		Enums.CHARACTER_PROPERTY.CURRENT_ENERGY:
			character.current_energy = new_value
		Enums.CHARACTER_PROPERTY.MAX_MAGIC:
			character.max_magic = new_value
		Enums.CHARACTER_PROPERTY.CURRENT_MAGIC:
			character.current_magic = new_value
		Enums.CHARACTER_PROPERTY.MIGHT:
			character.base_might = new_value
		Enums.CHARACTER_PROPERTY.AGILITY:
			character.base_agility = new_value
		Enums.CHARACTER_PROPERTY.WITS:
			character.base_wits = new_value
	Signals.CHARACTER_property_updated.emit(property)



func get_modified_property_value(property: Enums.CHARACTER_PROPERTY) -> Variant:
	var base_value = get_property_value(property)
	var modified_value = base_value
	for modifier in character.modifiers:
		if modifier.property == property:
			modified_value += modifier.value
	return modified_value


func equip_item(item: Item, slot: Enums.EQUIP_SLOT) -> void:
	if is_item_equipped(item):
		unequip_item(item)
	character.inventory.equipment_set[slot] = item
	Signals.CHARACTER_equipment_updated.emit(slot)
	for modifier in item.modifiers:
		add_new_modifier(modifier)



func unequip_item(item: Item) -> void:
	for slot in character.inventory.equipment_set:
		var slot_item = character.inventory.equipment_set[slot]
		if slot_item == item:
			character.inventory.equipment_set[slot] = null
			Signals.CHARACTER_equipment_updated.emit(slot)
			for modifier in item.modifiers:
				remove_modifier(modifier)



func get_inventory_items() -> Array:
	return character.inventory.items



func get_equipped_items() -> Array:
	var equipped_items = []
	for slot_key in character.inventory.equipment_set:
		var item = character.inventory.equipment_set[slot_key]
		equipped_items.append(item)
	return equipped_items



func get_equippable_items(slot_key: Enums.EQUIP_SLOT) -> Array:
	var equippable = []
	var equipment = character.inventory.get_items_of_type(Enums.ITEM_TYPE.EQUIPMENT)
	var weapons = character.inventory.get_items_of_type(Enums.ITEM_TYPE.WEAPON)
	for item in equipment:
		if item.item_data["slots"].has(slot_key):
			equippable.append(item)
	for item in weapons:
		if item.item_data["slots"].has(slot_key):
			equippable.append(item)
	return equippable



func get_type_items(item_type: Enums.ITEM_TYPE) -> Array:
	var type_items = []
	if is_instance_valid(character.inventory):
		type_items = character.inventory.get_items_of_type(item_type)
	return type_items



func get_equipment_slot_item(slot_key: Enums.EQUIP_SLOT) -> Item:
	return character.inventory.equipment_set[slot_key]



func get_item_equipment_slot(item: Item) -> Enums.EQUIP_SLOT:
	var equip_slot:= Enums.EQUIP_SLOT.NULL
	for slot in character.inventory.equipment_set:
		var equipped_item = character.inventory.equipment_set[slot]
		if equipped_item == item:
			equip_slot = slot
	return equip_slot



func get_all_equipment_modifiers() -> Array:
	var modifiers = []
	return modifiers



func add_new_modifier(modifier: Modifier) -> void:
	character.modifiers.append(modifier)
	Signals.CHARACTER_property_updated.emit(modifier.property)




func remove_modifier(modifier: Modifier) -> void:
	if character.modifiers.has(modifier):
		character.modifiers.erase(modifier)
	Signals.CHARACTER_property_updated.emit(modifier.property)




func slot_is_equipped(slot_key: Enums.EQUIP_SLOT) -> bool:
	var is_equipped = false
	var item = character.inventory.equipment_set[slot_key]
	if is_instance_valid(item):
		is_equipped = true
	return is_equipped



func is_item_equipped(item: Item) -> bool:
	var is_equipped = false
	var slots = item.item_data["slots"]
	for slot in slots:
		if character.inventory.equipment_set[slot] == item:
			is_equipped = true
	return is_equipped


func is_in_inventory(item: Item) -> bool:
	return character.inventory.items.has(item)



func add_new_item_to_inventory(item_key: Variant, item_type: Enums.ITEM_TYPE) -> void:
	character.inventory.add_item_by_key(item_key, item_type)


func remove_item_from_inventory(item: Item) -> void:
	if is_in_inventory(item):
		character.inventory.remove_item(item)