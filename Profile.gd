extends Control

var equip_slot_list = {}
var property_values = {}


func _ready() -> void:
	Signals.CHARACTER_created.connect(load_character_data)
	Signals.CHARACTER_equipment_updated.connect(update_equipment_slot)
	Signals.CHARACTER_property_updated.connect(update_property)
	Signals.CHARACTER_item_added_to_inventory.connect(handle_new_inventory_item)

	equip_slot_list = {
		Enums.EQUIP_SLOT.WEAPON_PRIMARY: %WeaponPrimarySlot,
		Enums.EQUIP_SLOT.WEAPON_SECONDARY: %WeaponSecondarySlot,
		Enums.EQUIP_SLOT.BACK: %BackSlot,
		Enums.EQUIP_SLOT.HEAD: %HeadSlot,
		Enums.EQUIP_SLOT.NECK: %NeckSlot,
		Enums.EQUIP_SLOT.TORSO: %TorsoSlot,
		Enums.EQUIP_SLOT.ARMS: %ArmsSlot,
		Enums.EQUIP_SLOT.HANDS: %HandsSlot,
		Enums.EQUIP_SLOT.LEGS: %LegsSlot,
		Enums.EQUIP_SLOT.FEET: %FeetSlot,
		Enums.EQUIP_SLOT.RING_1: %Ring1Slot,
		Enums.EQUIP_SLOT.RING_2: %Ring2Slot,
	}


	property_values = {
		Enums.CHARACTER_PROPERTY.CURRENT_HEALTH: %Health,
		Enums.CHARACTER_PROPERTY.MAX_HEALTH: %MaxHealth,
		Enums.CHARACTER_PROPERTY.CURRENT_ENERGY: %Energy,
		Enums.CHARACTER_PROPERTY.MAX_ENERGY: %MaxEnergy,
		Enums.CHARACTER_PROPERTY.CURRENT_MAGIC: %Magic,
		Enums.CHARACTER_PROPERTY.MAX_MAGIC: %MaxMagic,
		Enums.CHARACTER_PROPERTY.MIGHT: %Might,
		Enums.CHARACTER_PROPERTY.AGILITY: %Agility,
		Enums.CHARACTER_PROPERTY.WITS: %Wits,
		Enums.CHARACTER_PROPERTY.CARRY_WEIGHT: %CarryWeight,
	}


	%ResetInventory.add_callback(reset_inventory)
	
	%LevelButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.LEVEL))
	%HealthButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.HEALTH))
	%EnergyButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.ENERGY))
	%MagicButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.MAGIC))
	%MightButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.MIGHT))
	%AgilityButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.AGILITY))
	%WitsButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.WITS))
	%CarryWeightButton.add_callback(update_property_info.bind(Enums.CHARACTER_PROPERTY.CARRY_WEIGHT))


	%WeaponPrimaryButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.WEAPON_PRIMARY))
	%WeaponSecondaryButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.WEAPON_SECONDARY))
	%BackButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.BACK))
	%HeadButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.HEAD))
	%NeckButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.NECK))
	%TorsoButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.TORSO))
	%ArmsButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.ARMS))
	%HandsButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.HANDS))
	%LegsButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.LEGS))
	%FeetButton.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.FEET))
	%Ring1Button.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.RING_1))
	%Ring2Button.add_callback(update_slot_info.bind(Enums.EQUIP_SLOT.RING_2))


	%WeaponPrimaryEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.WEAPON_PRIMARY))
	%WeaponSecondaryEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.WEAPON_SECONDARY))
	%BackEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.BACK))
	%HeadEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.HEAD))
	%NeckEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.NECK))
	%TorsoEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.TORSO))
	%ArmsEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.ARMS))
	%HandsEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.HANDS))
	%LegsEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.LEGS))
	%FeetEdit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.FEET))
	%Ring1Edit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.RING_1))
	%Ring2Edit.pressed.connect(update_equip_list.bind(Enums.EQUIP_SLOT.RING_2))


func reset_equipment_info() -> void:
	%SlotName.text = ""
	%SlotDesc.text = ""
	%CurrentlyEquipped.visible = false
	for item in %EquipmentList.get_children():
		item.queue_free.call_deferred()



func reset_inventory() -> void:
	for button in %ItemTypeList.get_children():
		button.deselect()
	for button in %ItemList.get_children():
		button.deselect()
		button.visible = true
	reset_action_buttons()




func reset_action_buttons() -> void:
	%UseButton.visible = false
	%EquipButton.visible = false
	%UnequipButton.visible = false
	%DiscardButton.visible = false
	%UseButton.clear_callbacks()
	%EquipButton.clear_callbacks()
	%UnequipButton.clear_callbacks()
	%DiscardButton.clear_callbacks()



func load_character_data() -> void:
	reset_equipment_info()
	reset_inventory()
	var character = CharacterHandler.character
	%Name.text = "[b]%s[/b]" % character.name
	%Health.update_value(character.current_health)
	%Energy.update_value(character.current_energy)
	%Magic.update_value(character.current_magic)
	%Might.update_value(character.base_might)
	%Agility.update_value(character.base_agility)
	%Wits.update_value(character.base_wits)
	load_inventory()



func update_property(property: Enums.CHARACTER_PROPERTY) -> void:
	if !property_values.has(property):
		return
	var property_label = property_values[property]
	var new_value = CharacterHandler.get_modified_property_value(property)
	property_label.update_value(new_value)



	
func update_property_info(property_key: Enums.CHARACTER_PROPERTY) -> void:
	%DescScroll.scroll_vertical = 0
	var data_set = Data.get_data_set("character_property_data")
	var data = data_set[property_key]
	%PropertyName.text = data["name"]
	%PropertyDesc.text = data["desc"] 




func update_slot_info(slot_key: Enums.EQUIP_SLOT) -> void:
	var data_set = Data.get_data_set("equip_slot_data")
	var data = data_set[slot_key]
	%SlotName.text = data["name"]
	%SlotDesc.text = data["desc"]
	%CurrentlyEquipped.visible = false
	if CharacterHandler.slot_is_equipped(slot_key):
		var item = CharacterHandler.get_equipment_slot_item(slot_key)
		%CurrentlyEquipped.visible = true
		%CurrentlyEquippedButton.update_button(item.item_data["name"])
		%CurrentlyEquippedButton.add_callback(update_item_info.bind(item))



func update_equip_list(slot_key: Enums.EQUIP_SLOT) -> void:
	ObjectHandler.deselect_button_group("profile_equipment")
	update_slot_info(slot_key)
	for item in %EquipmentList.get_children():
		item.queue_free.call_deferred()
	var slot_items = CharacterHandler.get_equippable_items(slot_key)
	if slot_items.size() == 0:
		var label = RichTextLabel.new()
		label.fit_content = true
		label.bbcode_enabled = true
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = "[i]No available equipment[/i]"
		%EquipmentList.add_child(label)
	else:
		for item in slot_items:
			if !CharacterHandler.is_item_equipped(item):
				var button = ObjectHandler.new_game_button()
				button.button_text = item.item_data["name"]
				button.button_group = "profile_slot_item"
				button.add_callback(equip_item.bind(item, slot_key))
				button.add_callback(update_item_info.bind(item))
				%EquipmentList.add_child(button)




func load_item_types() -> void:
	var item_type_enums = Enums.get_enum_list("item_type")
	for item_type_name in item_type_enums:
		var item_type_key = item_type_enums[item_type_name]
		var data_set = Data.get_data_set("item_type_data")
		var data = data_set[item_type_key]
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "profile_item_type"
		button.add_callback(update_item_list.bind(item_type_key))
		%ItemTypeList.add_child(button)




func load_inventory() -> void:
	load_item_types()
	var inventory = CharacterHandler.get_inventory_items()
	inventory.sort_custom(ItemHandler.sort_alphabetical)
	for item in inventory:
		var button = ObjectHandler.new_game_button()
		button.button_text = item.item_data["name"]
		button.button_group = "profile_item"
		button.add_callback(update_item_info.bind(item))
		%ItemList.add_child(button)



func equip_item(item: Item, slot: Enums.EQUIP_SLOT) -> void:
	CharacterHandler.equip_item(item, slot)
	update_slot_info(slot)
	update_item_info(item)
	update_equip_list(slot)



func unequip_item(item: Item, slot: Enums.EQUIP_SLOT) -> void:
	CharacterHandler.unequip_item(item)
	update_slot_info(slot)
	update_item_info(item)
	update_equip_list(slot)


func handle_new_inventory_item(item: Item) -> void:
	update_item_list(item.item_type)



func item_has_button(item: Item) -> bool:
	var has_button = false
	for button in %ItemList.get_children():
		for callback in button.callbacks:
			if callback.get_method() == update_item_info.get_method():
				var callback_args = callback.get_bound_arguments()
				if callback_args.has(item):
					has_button = true
	print(item.item_data["name"])
	print(has_button)
	return has_button




func update_equipment_slot(updated_slot: Enums.EQUIP_SLOT) -> void:
	var slot = equip_slot_list[updated_slot]
	if slot.get_children().size() > 0:
		slot.get_child(0).queue_free()
	var item = CharacterHandler.get_equipment_slot_item(updated_slot)
	if is_instance_valid(item):
		var data = Data.get_item_data(item.object_key, item.item_type)
		var button = ObjectHandler.new_game_button()
		button.button_text = data["name"]
		button.button_group = "profile_slot_item"
		button.alignment = HORIZONTAL_ALIGNMENT_RIGHT
		button.add_callback(update_item_info.bind(item))
		slot.add_child(button)




func update_item_info(item: Item) -> void:
	reset_action_buttons()
	select_inventory_item(item)
	%ItemName.text = item.item_data["name"]
	%ItemDesc.text = item.item_data["desc"]
	if item.item_type == Enums.ITEM_TYPE.EQUIPMENT or item.item_type == Enums.ITEM_TYPE.WEAPON:
		if CharacterHandler.is_item_equipped(item):
			var slot = CharacterHandler.get_item_equipment_slot(item)
			%UnequipButton.visible = true
			%UnequipButton.add_callback(unequip_item.bind(item, slot))
		else:
			%EquipButton.visible = true
			%EquipButton.add_callback(equip_item.bind(item, item.item_data.slots[0]))
	
		



func update_item_list(item_type: Enums.ITEM_TYPE) -> void:
	var type_items = CharacterHandler.get_type_items(item_type)
	for item_button in %ItemList.get_children():
		item_button.visible = false
	for item in type_items:
		if item_has_button(item):
			for item_button in %ItemList.get_children():
				if item_button.button_text == item.item_data["name"]:
					item_button.visible = true
		else:
			var current_list = []
			for item_button in %ItemList.get_children():
				current_list.append(item_button)
				%ItemList.remove_child(item_button)
			var button = ObjectHandler.new_game_button()
			button.button_text = item.item_data["name"]
			button.button_group = "profile_item"
			button.add_callback(update_item_info.bind(item))
			var new_list = current_list
			new_list.append(button)
			new_list.sort_custom(sort_alphabetical)
			for item_button in new_list:
				%ItemList.add_child(item_button)




func select_inventory_item(item: Item) -> void:
	for button in %ItemTypeList.get_children():
		for callback in button.callbacks:
			if callback.get_method() == update_item_info.get_method():
				var callback_args = callback.get_bound_arguments()
				if callback_args.has(item):
					button.select()
	for button in %ItemList.get_children():
		for callback in button.callbacks:
			if callback.get_method() == update_item_info.get_method():
				var callback_args = callback.get_bound_arguments()
				if callback_args.has(item):
					button.select()




func sort_alphabetical(a: Node, b: Node) -> bool:
	if a.button_text < b.button_text:
		return true
	else:
		return false


func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		if visible == false:
			var buttons = ObjectHandler.get_group_buttons("profile")
			for button in buttons:
				button.deselect()
			buttons = ObjectHandler.get_group_buttons("profile_item")
			for button in buttons:
				button.deselect()
			buttons = ObjectHandler.get_group_buttons("profile_slot_item")
			for button in buttons:
				button.deselect()
			buttons = ObjectHandler.get_group_buttons("profile_item_type")
			for button in buttons:
				button.deselect()
			buttons = ObjectHandler.get_group_buttons("profile_equipment")
			for button in buttons:
				button.deselect()