extends Node


var state:= Enums.GAME_STATE.NULL:
	set(value):
		state = value
		Signals.GAME_state_changed.emit(state)



func _ready() -> void:
	Signals.ERROR_fatal.connect(_fatal_error)
	Signals.GAME_state_changed.connect(_handle_new_game_state)
	Signals.GAME_state_requested.connect(_handle_state_request)
	%PausedLabel.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

	var game_control = find_child("GameControl")
	game_control.gui_input.connect(_handle_game_input)

	CharacterHandler.new_character("Refrka")


	await get_tree().create_timer(5.0).timeout
	CharacterHandler.add_new_item_to_inventory(Enums.WEAPON.DAGGER_IRON, Enums.ITEM_TYPE.WEAPON)




func _unhandled_input(input: InputEvent) -> void:
	if input.is_action_pressed("pause"): 
		if !is_paused():
			Signals.GAME_state_requested.emit(Enums.GAME_STATE.PAUSE)
		else:
			Signals.GAME_state_requested.emit(Enums.GAME_STATE.PLAY)
	if input.is_action_pressed("encyclopedia"):
		_toggle_encyclopedia()
	if input.is_action_pressed("profile"):
		_toggle_profile()


func _handle_game_input(input: InputEvent) -> void:
	if input.is_action_pressed("deselect"):
		Signals.GLOBAL_deselect.emit()


func _toggle_encyclopedia() -> void:
	%Profile.visible = false
	%Encyclopedia.visible = !%Encyclopedia.visible


func _toggle_profile() -> void:
	%Encyclopedia.visible = false
	%Profile.visible = !%Profile.visible



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


func _fatal_error() -> void:
	Signals.GAME_state_requested.emit(Enums.GAME_STATE.PAUSE)