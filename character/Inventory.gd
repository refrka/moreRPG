class_name Inventory extends Node


var item_key_list = CharacterHandler.starting_item_key_list




var items = []
var coinage = CharacterHandler.starting_coinage

var equipment_set = {}



func _init() -> void:
	var equip_slot_enums = Enums.get_enum_list("equip_slot")
	for enum_name in equip_slot_enums:
		var enum_value = equip_slot_enums[enum_name]
		equipment_set[enum_value] = null
	
	for item_type in item_key_list:
		for item_key in item_key_list[item_type]:
			for i in item_key_list[item_type][item_key]:
				add_item_by_key(item_key, item_type)
	


func add_item(item: Item) -> void:
	items.append(item)
	add_key(item.object_key, item.item_type)
	Signals.CHARACTER_item_added_to_inventory.emit(item)


func add_item_by_key(item_key: Variant, item_type: Enums.ITEM_TYPE) -> void:
	var item = ItemHandler.create_item(item_key, item_type)
	items.append(item)
	add_key(item_key, item_type)
	Signals.CHARACTER_item_added_to_inventory.emit(item)


func remove_item(item: Item) -> void:
	if items.has(item):
		items.erase(item)
		remove_key(item.object_key, item.item_type)
		Signals.CHARACTER_item_removed_from_inventory.emit(item)



func remove_item_by_key(item_key: Variant, item_type: Enums.ITEM_TYPE) -> void:
	for item in items:
		if item.item_type == item_type and item.object_key == item_key:
			items.erase(item)
			remove_key(item.object_key, item.item_type)
			Signals.CHARACTER_item_removed_from_inventory.emit(item)




func add_key(item_key: Variant, item_type: Enums.ITEM_TYPE) -> void:
	if item_key_list[item_type].has(item_key):
		item_key_list[item_type][item_key] += 1
	else:
		item_key_list[item_type][item_key] = 1


# note for future self degredation (or validation)
func remove_key(item_key: Variant, item_type: Enums.ITEM_TYPE) -> void:
	if item_key_list[item_type].has(item_key):
		item_key_list[item_type][item_key] -= 1
		if item_key_list[item_type][item_key] == 0:
			item_key_list.erase(item_key)



func refresh_item_keys() -> void:
	pass



func refresh_items() -> void:
	pass




func get_items_of_type(type: Enums.ITEM_TYPE) -> Array:
	var type_items = []
	for item in items:
		if item.item_type == type:
			type_items.append(item)
	return type_items