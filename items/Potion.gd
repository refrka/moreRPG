class_name Potion extends Item

func _init(_key: Enums.POTION) -> void:
	super(Enums.ITEM_TYPE.POTION)
	object_key = _key
	get_data()