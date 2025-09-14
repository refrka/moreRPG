class_name Region extends GameObject


func _init(_key: Enums.REGION) -> void:
	object_type = Enums.GAME_OBJECT.REGION
	object_key = _key