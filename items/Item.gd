class_name Item extends GameObject

var item_type: Enums.ITEM_TYPE

func _init(_type: Enums.ITEM_TYPE) -> void:
	object_type = Enums.GAME_OBJECT.ITEM
	object_key = _type
	item_type = _type