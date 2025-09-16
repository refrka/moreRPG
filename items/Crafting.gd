class_name Crafting extends Item

func _init(_key: Enums.CRAFTING) -> void:
	super(Enums.ITEM_TYPE.CRAFTING)
	object_key = _key
	get_data()