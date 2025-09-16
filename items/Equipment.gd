class_name Equipment extends Item

func _init(_key: Enums.EQUIPMENT) -> void:
	super(Enums.ITEM_TYPE.EQUIPMENT)
	object_key = _key
	get_data()