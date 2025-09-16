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
	clear_info()
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


func load_type_items(item_type_key: Enums.ITEM_TYPE) -> void:
	for item_type in type_lists:
		if item_type != item_type_key:
			for item_key in type_lists[item_type]:
				var button = type_lists[item_type][item_key]
				button.visible = false
		else:
			for item_key in type_lists[item_type]:
				var button = type_lists[item_type][item_key]
				button.visible = true


func load_item_type(data: Dictionary) -> void:
	for item_type_key in item_type_list:
		var button = item_type_list[item_type_key]
		if item_type_key == data["type"]:
			button.visible = true
		else:
			button.visible = false


func load_items() -> void:
	var all_buttons_list = []
	
	var crafting_buttons = get_item_buttons(Enums.ITEM_TYPE.CRAFTING)
	var equipment_buttons = get_item_buttons(Enums.ITEM_TYPE.EQUIPMENT)
	var potion_buttons = get_item_buttons(Enums.ITEM_TYPE.POTION)
	var provision_buttons = get_item_buttons(Enums.ITEM_TYPE.PROVISION)
	var tool_buttons = get_item_buttons(Enums.ITEM_TYPE.TOOL)
	var valuable_buttons = get_item_buttons(Enums.ITEM_TYPE.VALUABLE)
	var weapon_buttons = get_item_buttons(Enums.ITEM_TYPE.WEAPON)



	for button in crafting_buttons:
		all_buttons_list.append(button)
	for button in equipment_buttons:
		all_buttons_list.append(button)
	for button in potion_buttons:
		all_buttons_list.append(button)
	for button in provision_buttons:
		all_buttons_list.append(button)
	for button in tool_buttons:
		all_buttons_list.append(button)
	for button in valuable_buttons:
		all_buttons_list.append(button)
	for button in weapon_buttons:
		all_buttons_list.append(button)

	all_buttons_list.sort_custom(sort_alphabetical)
	for button in all_buttons_list:
		%ItemList.add_child(button)


func sort_alphabetical(a, b) -> bool:
	var a_name = a.button_text.to_lower()
	var b_name = b.button_text.to_lower()
	if a_name < b_name:
		return true
	else:
		return false


func get_item_buttons(item_type: Enums.ITEM_TYPE) -> Array:
	var button_list = []
	var enum_list = []
	match item_type:
		Enums.ITEM_TYPE.CRAFTING:
			enum_list = Enums.get_enum_list("crafting")
		Enums.ITEM_TYPE.EQUIPMENT:
			enum_list = Enums.get_enum_list("equipment")
		Enums.ITEM_TYPE.POTION:
			enum_list = Enums.get_enum_list("potion")
		Enums.ITEM_TYPE.PROVISION:
			enum_list = Enums.get_enum_list("provision")
		Enums.ITEM_TYPE.TOOL:
			enum_list = Enums.get_enum_list("tool")
		Enums.ITEM_TYPE.VALUABLE:
			enum_list = Enums.get_enum_list("valuable")
		Enums.ITEM_TYPE.WEAPON:
			enum_list = Enums.get_enum_list("weapon")
	for enum_name in enum_list:
		var enum_value = enum_list[enum_name]
		var data = Data.get_item_data(enum_value, item_type)
		if Data.is_data_valid(data):
			var button = ObjectHandler.new_game_button()
			button.button_text = data["name"]
			button.button_group = "item_list"
			button.add_callback(update_item_info.bind(data))
			button.add_callback(load_item_type.bind(data))
			type_lists[item_type][enum_value] = button
			button_list.append(button)
	return button_list
	

func reset_lists() -> void:
	var game_buttons = ObjectHandler.get_group_buttons("item_list")
	for button in game_buttons:
		button.deselect()
		button.visible = true



func clear_info() -> void:
	%Name.text = ""
	%Description.text = ""
	%EquipSlot.visible = false



func update_item_type_info(data: Dictionary) -> void:
	clear_info()
	%Name.text = data["name"]
	%Description.text = data["desc"]


func update_item_info(data: Dictionary) -> void:
	clear_info()
	%Name.text = data["name"]
	%Description.text = data["desc"]
	if data["type"] == Enums.ITEM_TYPE.EQUIPMENT or data["type"] == Enums.ITEM_TYPE.WEAPON:
		var equip_slot_data = Data.get_data_set("equip_slot_data")
		var slot_string: String
		for slot in data["slots"]:
			var slot_data = equip_slot_data[slot]
			var index = data["slots"].find(slot)
			if index == data["slots"].size() - 1:
				slot_string += slot_data["name"]
			else:
				slot_string += "%s, " % slot_data["name"]
		%EquipSlot.visible = true
		%EquipSlotName.text = slot_string
	%Weight.text = str(data["weight"])