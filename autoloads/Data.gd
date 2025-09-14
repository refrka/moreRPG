extends Node


var object_data = "res://data/system/object_data.gd"

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

var null_data = "res://data/system/null_data.gd"




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
	var data_set = {}
	match type:
		Enums.ITEM_TYPE.CRAFTING:
			data_set = get_crafting_data(key)
		Enums.ITEM_TYPE.EQUIPMENT:
			data_set = get_equipment_data(key)
		Enums.ITEM_TYPE.POTION:
			data_set = get_potion_data(key)
		Enums.ITEM_TYPE.PROVISION:
			data_set = get_provision_data(key)
		Enums.ITEM_TYPE.TOOL:
			data_set = get_tool_data(key)
		Enums.ITEM_TYPE.VALUABLE:
			data_set = get_valuable_data(key)
		Enums.ITEM_TYPE.WEAPON:
			data_set = get_weapon_data(key)
	return data_set


func get_crafting_data(crafting_key: Enums.CRAFTING) -> Dictionary:
	var crafting_data_set = get_data_set("crafting_item_data")
	return crafting_data_set[crafting_key]


func get_equipment_data(equipment_key: Enums.EQUIPMENT) -> Dictionary:
	var equipment_data_set = get_data_set("equipment_item_data")
	return equipment_data_set[equipment_key]


func get_potion_data(potion_key: Enums.POTION) -> Dictionary:
	var potion_data_set = get_data_set("potion_item_data")
	return potion_data_set[potion_key]


func get_provision_data(provision_key: Enums.PROVISION) -> Dictionary:
	var provision_data_set = get_data_set("provision_item_data")
	return provision_data_set[provision_key]


func get_tool_data(tool_key: Enums.TOOL) -> Dictionary:
	var tool_data_set = get_data_set("tool_item_data")
	return tool_data_set[tool_key]


func get_valuable_data(valuable_key: Enums.VALUABLE) -> Dictionary:
	var valuable_data_set = get_data_set("valuable_item_data")
	return valuable_data_set[valuable_key]


func get_weapon_data(weapon_key: Enums.WEAPON) -> Dictionary:
	var weapon_data_set = get_data_set("weapon_item_data")
	return weapon_data_set[weapon_key]



func get_null_data() -> Dictionary:
	var data = get_data_set("null_data")
	return data