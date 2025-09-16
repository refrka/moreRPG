class_name Tool extends Item

func _init(_key: Enums.TOOL) -> void:
	super(Enums.ITEM_TYPE.TOOL)
	object_key = _key
	get_data()