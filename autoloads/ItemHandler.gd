extends Node


func create_item(item_key: Variant, item_type: Enums.ITEM_TYPE) -> Item:
	var item: Item
	match item_type:
		Enums.ITEM_TYPE.NULL:
			pass
		Enums.ITEM_TYPE.CRAFTING:
			item = Crafting.new(item_key)
		Enums.ITEM_TYPE.EQUIPMENT:
			item = Equipment.new(item_key)
		Enums.ITEM_TYPE.POTION:
			item = Potion.new(item_key)
		Enums.ITEM_TYPE.PROVISION:
			item = Provision.new(item_key)
		Enums.ITEM_TYPE.TOOL:
			item = Tool.new(item_key)
		Enums.ITEM_TYPE.VALUABLE:
			item = Valuable.new(item_key)
		Enums.ITEM_TYPE.WEAPON:
			item = Weapon.new(item_key)
	return item



func get_all_item_list() -> Dictionary:
	var list = {}
	list[Enums.ITEM_TYPE.CRAFTING] = Enums.get_enum_list("crafting")
	list[Enums.ITEM_TYPE.EQUIPMENT] = Enums.get_enum_list("equipment")
	list[Enums.ITEM_TYPE.POTION] = Enums.get_enum_list("potion")
	list[Enums.ITEM_TYPE.PROVISION] = Enums.get_enum_list("provision")
	list[Enums.ITEM_TYPE.TOOL] = Enums.get_enum_list("tool")
	list[Enums.ITEM_TYPE.VALUABLE] = Enums.get_enum_list("valuable")
	list[Enums.ITEM_TYPE.WEAPON] = Enums.get_enum_list("weapon")
	return list