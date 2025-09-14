class_name sysEnums extends Node


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


enum GameObject {
	NULL,
	CHARACTER_PROPERTY,
	ENTITY,
	ITEM,
	LOCATION,
	REGION,
}


enum GameState {
	NULL,
	PAUSE,
	PLAY,
}