class_name Provision extends Item

func _init(_key: Enums.PROVISION) -> void:
	super(Enums.ITEM_TYPE.PROVISION)
	object_key = _key
	get_data()