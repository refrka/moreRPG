extends Node


var state:= Enums.GAME_STATE.NULL:
	set(value):
		state = value
		Signals.GAME_state_changed.emit(state)



func _ready() -> void:
	%PausedLabel.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	Signals.GAME_state_changed.connect(_handle_new_game_state)
	Signals.GAME_state_requested.connect(_handle_state_request)

	var game_control = find_child("GameControl")
	game_control.gui_input.connect(_handle_game_input)








func _unhandled_input(input: InputEvent) -> void:
	if input.is_action_pressed("pause"): 
		if !is_paused():
			Signals.GAME_state_requested.emit(Enums.GAME_STATE.PAUSE)
		else:
			Signals.GAME_state_requested.emit(Enums.GAME_STATE.PLAY)
	
	if input.is_action_pressed("deselect"):
		Signals.GLOBAL_deselect.emit()
	if input.is_action_pressed("control_panel_toggle"):
		_toggle_control_panel()
	if input.is_action_pressed("encyclopedia"):
		_toggle_encyclopedia()


func _handle_game_input(input: InputEvent) -> void:
	if input.is_action_pressed("deselect"):
		Signals.GLOBAL_deselect.emit()


func _toggle_control_panel() -> void:
	%ControlPanel.visible = !%ControlPanel.visible


func _toggle_encyclopedia() -> void:
	%Encyclopedia.visible = !%Encyclopedia.visible



func _handle_new_game_state(new_state: Enums.GAME_STATE) -> void:
	if new_state == Enums.GAME_STATE.PAUSE:
		get_tree().paused = true
		%PausedLabel.visible = true
		Alert.new_alert("Game paused")
	elif new_state == Enums.GAME_STATE.PLAY:
		get_tree().paused = false
		%PausedLabel.visible = false
		Alert.new_alert("Game unpaused")



func _handle_state_request(requested_state: Enums.GAME_STATE) -> void:
	state = requested_state



func is_paused() -> bool:
	var paused = false
	if state == Enums.GAME_STATE.PAUSE:
		paused = true
	return paused