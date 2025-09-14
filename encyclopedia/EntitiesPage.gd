extends MarginContainer

var entity_type_list: Dictionary

var creature_list: Dictionary
var humanoid_list: Dictionary
var spirit_list: Dictionary



var type_lists = {
	Enums.ENTITY_TYPE.CREATURE: creature_list,
	Enums.ENTITY_TYPE.HUMANOID: humanoid_list,
	Enums.ENTITY_TYPE.SPIRIT: spirit_list, 
}


func _ready() -> void:
	load_entity_types()
	load_entities()
	%Reset.add_callback(reset_lists)


func load_entity_types() -> void:
	var list = Enums.get_enum_list("entity_type")
	for entity_type_name in list:
		var enum_value = list[entity_type_name] as Enums.ENTITY_TYPE
		entity_type_list[enum_value] = null

	for entity_type_key in entity_type_list:
		var data = Data.get_entity_type_data(entity_type_key)
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "entity_list"
		button.add_callback(load_type_entities.bind(entity_type_key))
		button.add_callback(update_entity_type_info.bind(data))
		entity_type_list[entity_type_key] = button
		%EntityTypeList.add_child(button)


func load_type_entities(entity_type_key: Enums.ENTITY_TYPE) -> void:
	for entity_type in type_lists:
		if entity_type != entity_type_key:
			for entity_key in type_lists[entity_type]:
				var button = type_lists[entity_type][entity_key]
				button.visible = false
		else:
			for entity_key in type_lists[entity_type]:
				var button = type_lists[entity_type][entity_key]
				button.visible = true


func load_entity_type(data: Dictionary) -> void:
	for entity_type_key in entity_type_list:
		var button = entity_type_list[entity_type_key]
		if entity_type_key == data["type"]:
			button.visible = true
		else:
			button.visible = false



func load_entities() -> void:
	var all_buttons_list = []

	var creature_buttons = get_entity_buttons(Enums.ENTITY_TYPE.CREATURE)
	var humanoid_buttons = get_entity_buttons(Enums.ENTITY_TYPE.HUMANOID)
	var spirit_buttons = get_entity_buttons(Enums.ENTITY_TYPE.SPIRIT)

	for button in creature_buttons:
		all_buttons_list.append(button)
	for button in humanoid_buttons:
		all_buttons_list.append(button)
	for button in spirit_buttons:
		all_buttons_list.append(button)

	all_buttons_list.sort_custom(sort_alphabetical)
	for button in all_buttons_list:
		%EntityList.add_child(button)


func sort_alphabetical(a, b) -> bool:
	var a_name = a.button_text.to_lower()
	var b_name = b.button_text.to_lower()
	if a_name < b_name:
		return true
	else:
		return false


func get_entity_buttons(entity_type: Enums.ENTITY_TYPE) -> Array:
	var button_list = []
	var enum_list = []
	match entity_type:
		Enums.ENTITY_TYPE.CREATURE:
			enum_list = Enums.get_enum_list("creature")
		Enums.ENTITY_TYPE.HUMANOID:
			enum_list = Enums.get_enum_list("humanoid")
		Enums.ENTITY_TYPE.SPIRIT:
			enum_list = Enums.get_enum_list("spirit")
	for enum_name in enum_list:
		var enum_value = enum_list[enum_name]
		var data = Data.get_entity_data(enum_value, entity_type)
		if Data.is_data_valid(data):
			var button = ObjectHandler.new_game_button()
			button.button_text = data["name"]
			button.button_group = "entity_list"
			button.add_callback(update_entity_info.bind(data))
			button.add_callback(load_entity_type.bind(data))
			type_lists[entity_type][enum_value] = button
			button_list.append(button)
	return button_list


func update_entity_type_info(data: Dictionary) -> void:
	%Name.text = data["name"]
	%Description.text = data["desc"]


func update_entity_info(data: Dictionary) -> void:
	%Name.text = data["name"]
	%Description.text = data["desc"]
	

func reset_lists() -> void:
	var game_buttons = ObjectHandler.get_group_buttons("entity_list")
	for button in game_buttons:
		button.deselect()
		button.visible = true