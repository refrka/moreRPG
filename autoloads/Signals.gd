extends Node
@warning_ignore_start("unused_signal")


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS






signal GAME_state_changed(new_state: Enums.GAME_STATE)
signal GAME_state_requested(requested_state: Enums.GAME_STATE)


signal GLOBAL_deselect



signal OBJECT_card_selected(object: GameObject)