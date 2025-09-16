class_name Valuable extends Item

func _init(_key: Enums.VALUABLE) -> void:
	super(Enums.ITEM_TYPE.VALUABLE)
	object_key = _key
	get_data()