class_name Location extends GameObject


func _init(_key: Enums.LOCATION) -> void:
	object_type = Enums.GAME_OBJECT.LOCATION
	object_key = _key