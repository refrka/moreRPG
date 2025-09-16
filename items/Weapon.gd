class_name Weapon extends Item

func _init(_key: Enums.WEAPON) -> void:
	super(Enums.ITEM_TYPE.WEAPON)
	object_key = _key
	get_data()