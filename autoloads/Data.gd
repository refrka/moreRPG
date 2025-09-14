extends Node


var object_data = "res://data/system/object_data.gd"

var character_property_data = "res://data/character/character_property_data.gd"


var item_type_data = "res://data/items/item_type_data.gd"
var crafting_item_data = "res://data/items/crafting_item_data.gd"
var equipment_item_data = "res://data/items/equipment_item_data.gd"
var potion_item_data = "res://data/items/potion_item_data.gd"
var provision_item_data = "res://data/items/provision_item_data.gd"
var tool_item_data = "res://data/items/tool_item_data.gd"
var valuable_item_data = "res://data/items/valuable_item_data.gd"
var weapon_item_data = "res://data/items/weapon_item_data.gd"

var region_data = "res://data/world/region_data.gd"
var location_data = "res://data/world/location_data.gd"

var entity_type_data = "res://data/entities/entity_type_data.gd"
var creature_data = "res://data/entities/creature_data.gd"
var humanoid_data = "res://data/entities/humanoid_data.gd"
var spirit_data = "res://data/entities/spirit_data.gd"

var null_data = "res://data/system/null_data.gd"

var item_type_paths = {
	Enums.ITEM_TYPE.NULL: null_data,
	Enums.ITEM_TYPE.CRAFTING: crafting_item_data,
	Enums.ITEM_TYPE.EQUIPMENT: equipment_item_data,
	Enums.ITEM_TYPE.POTION: potion_item_data,
	Enums.ITEM_TYPE.PROVISION: provision_item_data,
	Enums.ITEM_TYPE.TOOL: tool_item_data,
	Enums.ITEM_TYPE.VALUABLE: valuable_item_data,
	Enums.ITEM_TYPE.WEAPON: weapon_item_data,
}

var entity_type_paths = {
	Enums.ENTITY_TYPE.NULL: null_data,
	Enums.ENTITY_TYPE.CREATURE: creature_data,
	Enums.ENTITY_TYPE.HUMANOID: humanoid_data,
	Enums.ENTITY_TYPE.SPIRIT: spirit_data,
}


func get_data_set(data_set_name: String) -> Dictionary:
	var data_path = get(data_set_name)
	var data = load(data_path).new().data
	return data




func get_region_data(region_key: Enums.REGION) -> Dictionary:
	var region_data_set = get_data_set("region_data")
	return region_data_set[region_key]

func get_location_data(location_key: Enums.LOCATION) -> Dictionary:
	var location_data_set = get_data_set("location_data")
	return location_data_set[location_key]




func get_item_type_data(item_type_key: Enums.ITEM_TYPE) -> Dictionary:
	var item_type_data_set = get_data_set("item_type_data")
	return item_type_data_set[item_type_key]


func get_item_data(key: Variant, type: Enums.ITEM_TYPE) -> Dictionary:
	var data = {}
	match type:
		Enums.ITEM_TYPE.CRAFTING:
			data = get_crafting_data(key)
		Enums.ITEM_TYPE.EQUIPMENT:
			data = get_equipment_data(key)
		Enums.ITEM_TYPE.POTION:
			data = get_potion_data(key)
		Enums.ITEM_TYPE.PROVISION:
			data = get_provision_data(key)
		Enums.ITEM_TYPE.TOOL:
			data = get_tool_data(key)
		Enums.ITEM_TYPE.VALUABLE:
			data = get_valuable_data(key)
		Enums.ITEM_TYPE.WEAPON:
			data = get_weapon_data(key)
	return data


func get_crafting_data(key: Enums.CRAFTING) -> Dictionary:
	var data_set = get_data_set("crafting_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid crafting item key requested: %s" % key)
		return {}


func get_equipment_data(key: Enums.EQUIPMENT) -> Dictionary:
	var data_set = get_data_set("equipment_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid equipment item key requested: %s" % key)
		return {}


func get_potion_data(key: Enums.POTION) -> Dictionary:
	var data_set = get_data_set("potion_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid potion item key requested: %s" % key)
		return {}


func get_provision_data(key: Enums.PROVISION) -> Dictionary:
	var data_set = get_data_set("provision_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid provision item key requested: %s" % key)
		return {}


func get_tool_data(key: Enums.TOOL) -> Dictionary:
	var data_set = get_data_set("tool_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid tool item key requested: %s" % key)
		return {}


func get_valuable_data(key: Enums.VALUABLE) -> Dictionary:
	var data_set = get_data_set("valuable_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid valuable item key requested: %s" % key)
		return {}


func get_weapon_data(key: Enums.WEAPON) -> Dictionary:
	var data_set = get_data_set("weapon_item_data")
	if data_set.has(key):
		return data_set[key]
	else:
		Debug.log_error("Invalid weapon item key requested: %s" % key)
		return {}



func get_null_data() -> Dictionary:
	var data = get_data_set("null_data")
	return data


func item_has_data(item_key: Variant, item_type: Enums.ITEM_TYPE) -> bool:
	var has_data = false
	var data_path = item_type_paths[item_type]
	var data_set = load(data_path).new().data
	if data_set.has(item_key):
		has_data = true
	return has_data


func get_entity_type_data(entity_type_key: Enums.ENTITY_TYPE) -> Dictionary:
	var entity_type_data_set = get_data_set("entity_type_data")
	return entity_type_data_set[entity_type_key]


func get_entity_data(key: Variant, type: Enums.ENTITY_TYPE) -> Dictionary:
	var data = {}
	match type:
		Enums.ENTITY_TYPE.CREATURE:
			data = get_creature_data(key)
		Enums.ENTITY_TYPE.HUMANOID:
			data = get_humanoid_data(key)
		Enums.ENTITY_TYPE.SPIRIT:
			data = get_spirit_data(key)
	return data


func get_creature_data(key: Enums.CREATURE) -> Dictionary:
	var data_set = get_data_set("creature_data")
	if data_set.has(key):
		return data_set[key]
	else:
		return {}


func get_humanoid_data(key: Enums.HUMANOID) -> Dictionary:
	var data_set = get_data_set("humanoid_data")
	if data_set.has(key):
		return data_set[key]
	else:
		return {}


func get_spirit_data(key: Enums.SPIRIT) -> Dictionary:
	var data_set = get_data_set("spirit_data")
	if data_set.has(key):
		return data_set[key]
	else:
		return {}



func is_data_valid(data: Dictionary) -> bool:
	var valid = true
	if !data.has("name"):
		valid = false
	if !data.has("desc"):
		valid = false
	return valid