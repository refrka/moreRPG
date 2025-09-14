extends Control

var selected_property: Enums.CHARACTER_PROPERTY


func _ready() -> void:
	Signals.CHARACTER_created.connect(load_character_data)
	
	%LevelButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.LEVEL))
	%HealthButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.CURRENT_HEALTH))
	%EnergyButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.CURRENT_ENERGY))
	%MagicButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.CURRENT_MAGIC))


func load_character_data() -> void:
	var character = CharacterHandler.character
	%Name.text = "[b]%s[/b]" % character.name
	%Health.update_value(character.current_health)
	%Energy.update_value(character.current_energy)
	%Magic.update_value(character.current_magic)

	
func update_property_info(property_key: Enums.CHARACTER_PROPERTY) -> void:
	var data_set = Data.get_data_set("character_property_data")
	var data = data_set[property_key]
	%PropertyName.text = data["name"]
	%PropertyDesc.text = data["desc"]


func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		if visible == false:
			var buttons = ObjectHandler.get_group_buttons("profile")
			for button in buttons:
				button.deselect()