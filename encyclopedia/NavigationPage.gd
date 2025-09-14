extends MarginContainer


var region_list: Dictionary
var location_list: Dictionary

var region_data: Dictionary
var location_data: Dictionary





func _ready() -> void:
	region_data = Data.get_data_set("region_data")
	location_data = Data.get_data_set("location_data")

	load_regions()
	load_locations()
	
	%Reset.add_callback(reset_lists)



func load_regions() -> void:
	var list = Enums.get_enum_list("region")
	for region_name in list:
		var enum_value = list[region_name] as Enums.REGION
		region_list[enum_value] = null
	
	for region_key in region_list:
		var data = Data.get_region_data(region_key)
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "navigation_list"
		button.add_callback(load_region_locations.bind(region_key))
		button.add_callback(update_region_info.bind(data))
		region_list[region_key] = button
		%RegionList.add_child(button)




func load_locations() -> void:
	var list = Enums.get_enum_list("location")
	for location_name in list:
		var enum_value = list[location_name] as Enums.LOCATION
		location_list[enum_value] = null
	
	for location_key in location_list:
		var data = Data.get_location_data(location_key)
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "navigation_list"
		button.add_callback(load_location_regions.bind(location_key))
		button.add_callback(update_location_info.bind(data))
		location_list[location_key] = button
		%LocationList.add_child(button)



func load_region_locations(region_key: Enums.REGION) -> void:
	for location_key in location_list:
		var data = Data.get_location_data(location_key)
		if data.regions.has(region_key):
			location_list[location_key].visible = true
		else:
			location_list[location_key].visible = false



func load_location_regions(location_key: Enums.LOCATION) -> void:
	for region_key in region_list:
		var data = Data.get_location_data(location_key)
		if data["regions"].has(region_key):
			region_list[region_key].visible = true
		else:
			region_list[region_key].visible = false



func update_region_info(data: Dictionary) -> void:
	%Name.text = "[i]%s[/i]" % data["name"]
	%Description.text = data["desc"]


func update_location_info(data: Dictionary) -> void:
	%Name.text = "[i]%s[/i]" % data["name"]
	%Description.text = data["desc"]



func reset_lists() -> void:
	var game_buttons = ObjectHandler.get_group_buttons("navigation_list")
	for button in game_buttons:
		if button.button_group == "navigation_list":
			button.deselect()
			button.visible = true




func _handle_gui_input(input: InputEvent) -> void:
	if input.is_action_pressed("select"):
		var game_buttons = get_tree().get_nodes_in_group("game_button")
		for button in game_buttons:
			if button.button_group == "navigation_list":
				button.deselect()
		reset_lists() 