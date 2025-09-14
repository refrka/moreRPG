extends Node

var game_button_scene = preload("res://elements/GameButton.tscn")

func new_game_button() -> GameButton:
	var button = game_button_scene.instantiate()
	return button


func get_group_buttons(group_name: String) -> Array:
	var group_buttons = []
	var game_buttons = get_tree().get_nodes_in_group("game_button")
	for button in game_buttons:
		if button.button_group == group_name:
			group_buttons.append(button)
	return group_buttons


func deselect_button_group(group_name: String) -> void:
	var group_buttons = get_group_buttons(group_name)
	for button in group_buttons:
		button.deselect()