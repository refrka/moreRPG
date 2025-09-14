extends MarginContainer

var item_type_list: Dictionary

var crafting_list: Dictionary
var equipment_list: Dictionary
var potion_list: Dictionary
var provision_list: Dictionary
var tool_list: Dictionary
var valuable_list: Dictionary
var weapon_list: Dictionary

var type_lists = {
	Enums.ITEM_TYPE.CRAFTING: crafting_list,
	Enums.ITEM_TYPE.EQUIPMENT: equipment_list,
	Enums.ITEM_TYPE.POTION: potion_list,
	Enums.ITEM_TYPE.PROVISION: provision_list,
	Enums.ITEM_TYPE.TOOL: tool_list,
	Enums.ITEM_TYPE.VALUABLE: valuable_list,
	Enums.ITEM_TYPE.WEAPON: weapon_list,
}

func _ready() -> void:
	
	load_item_types()
	load_items()


	%Reset.add_callback(reset_lists)



func load_item_types() -> void:
	var list = Enums.get_enum_list("item_type")
	for item_type_name in list:
		var enum_value = list[item_type_name] as Enums.ITEM_TYPE
		item_type_list[enum_value] = null

	for item_type_key in item_type_list:
		var data = Data.get_item_type_data(item_type_key)
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "item_list"
		button.add_callback(load_type_items.bind(item_type_key))
		button.add_callback(update_item_type_info.bind(data))
		item_type_list[item_type_key] = button
		%ItemTypeList.add_child(button)


func load_items() -> void:
	var all_item_list = []
	var crafting_list = Enums.get_enum_list("crafting")
	for crafting_name in crafting_list:
		var enum_value = crafting_list[crafting_name]
		var data = Data.get_item_data(enum_value, Enums.ITEM_TYPE.CRAFTING)
		print(data)

func reset_lists() -> void:
	pass


func load_type_items(item_type_key: Enums.ITEM_TYPE) -> void:
	pass


func update_item_type_info(data: Dictionary) -> void:
	pass